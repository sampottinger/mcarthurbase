class VocabularyWordsController < ApplicationController
  # GET /vocabulary_words
  # GET /vocabulary_words.json
  def index
    @vocabulary_words = VocabularyWord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @vocabulary_words }
    end
  end

  # GET /vocabulary_words/1
  # GET /vocabulary_words/1.json
  def show
    @vocabulary_word = VocabularyWord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @vocabulary_word }
    end
  end

  # GET /vocabulary_words/new
  # GET /vocabulary_words/new.json
  def new
    @vocabulary_word = VocabularyWord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @vocabulary_word }
    end
  end

  # GET /vocabulary_words/1/edit
  def edit
    @vocabulary_word = VocabularyWord.find(params[:id])
  end

  # POST /vocabulary_words
  # POST /vocabulary_words.json
  def create
    @vocabulary_word = VocabularyWord.new(params[:vocabulary_word])

    respond_to do |format|
      if @vocabulary_word.save
        format.html { redirect_to @vocabulary_word, :notice => 'Vocabulary word was successfully created.' }
        format.json { render :json => @vocabulary_word, :status => :created, :location => @vocabulary_word }
      else
        format.html { render :action => "new" }
        format.json { render :json => @vocabulary_word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vocabulary_words/1
  # PUT /vocabulary_words/1.json
  def update
    @vocabulary_word = VocabularyWord.find(params[:id])

    respond_to do |format|
      if @vocabulary_word.update_attributes(params[:vocabulary_word])
        format.html { redirect_to @vocabulary_word, :notice => 'Vocabulary word was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @vocabulary_word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabulary_words/1
  # DELETE /vocabulary_words/1.json
  def destroy
    @vocabulary_word = VocabularyWord.find(params[:id])
    @vocabulary_word.destroy

    respond_to do |format|
      format.html { redirect_to vocabulary_words_url }
      format.json { head :ok }
    end
  end
end
