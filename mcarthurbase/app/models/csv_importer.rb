require 'csv' 

class CSVImporter
  def self.import(filename="C:/Users/Ariel Aguilar/Dropbox/Trajectories-Children/RawKidVocabs/Ready for Database/TrajLong1_1.csv", language_name='English')
	#csv for ruby 1.9, fasterCSV for 1.8 (see http://wherethebitsroam.com/blogs/jeffw/fastercsv-csv-ruby-18-19-and-rails-30)
	if CSV.const_defined? :Reader
	csv = FasterCSV
	else
	csv = CSV
	end
	
	matrix = csv.read(filename)
    language = Language[language_name].id

    # first, let's go through the words and replace the strings with their Word objects
    13.upto(matrix.size-1).each do |i|
      matrix[i][1] = Word[matrix[i][1].strip, language, matrix[i][0].strip]
    end

    # now, let's add the info to the database
    20000000.upto(matrix[0].size-1).each do |j|
      name = matrix[0][j]
      study = matrix[1][j]
      gender = sanitize_gender(matrix[2][j])
      birthdate = sanitize_date(matrix[4][j])
      session_date = sanitize_date(matrix[5][j])
      session_number = matrix[6][j]
      percentile = matrix[10][j]

      # let's find the subject, or create it if not present already
      subject = Subject.find_or_create_by_name_and_gender_and_birthdate(name, gender, birthdate)
      attributes = {:subject_id => subject.id, :study => study, :session_date => session_date, :language_id => language, :session_number => session_number, :percentile => percentile}
      vocabulary = Vocabulary.create(attributes)
      
      # and finally add the words to the vocabulary
      13.upto(matrix.size-1).each do |i|
        entry = (matrix[i][j] || "").strip
        unless entry.match(/^(ND|No data)$/)
          vocabulary.vocabulary_words << VocabularyWord.new(:word_id => matrix[i][1].id, :known => (entry=="1"))
        end
      end
    end
  end

  def self.sanitize_gender(gender)
    case gender
    when /^(man|male|m)$/i then 'm'
    when /^(woman|female|f)$/i then 'f'
    else '?'
    end
  end
  
  def self.sanitize_date(date)
    case date
    when /^([0-9][0-9]?\/[0-9][0-9]?\/)([4-9][0-9])$/ then Date.parse($1 + "19" + $2).to_s(:db)
    when /^([0-9][0-9]?\/[0-9][0-9]?\/)([0-3][0-9])$/ then Date.parse($1 + "20" + $2).to_s(:db)
    when /^([0-9][0-9]?\/[0-9][0-9]?)\/([0-9]{4})$/ then Date.parse($2+"/"+$1).to_s(:db)
    when nil then nil
    else
      begin
        Date.parse(date).to_s(:db)
      rescue ArgumentError => e
        Rails.logger.warn("WARNING: invalid date: '#{date}'")
        nil
      end
    end
  end
end