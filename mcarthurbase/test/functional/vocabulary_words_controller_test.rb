require 'test_helper'

class VocabularyWordsControllerTest < ActionController::TestCase
  setup do
    @vocabulary_word = vocabulary_words(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vocabulary_words)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vocabulary_word" do
    assert_difference('VocabularyWord.count') do
      post :create, :vocabulary_word => @vocabulary_word.attributes
    end

    assert_redirected_to vocabulary_word_path(assigns(:vocabulary_word))
  end

  test "should show vocabulary_word" do
    get :show, :id => @vocabulary_word.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vocabulary_word.to_param
    assert_response :success
  end

  test "should update vocabulary_word" do
    put :update, :id => @vocabulary_word.to_param, :vocabulary_word => @vocabulary_word.attributes
    assert_redirected_to vocabulary_word_path(assigns(:vocabulary_word))
  end

  test "should destroy vocabulary_word" do
    assert_difference('VocabularyWord.count', -1) do
      delete :destroy, :id => @vocabulary_word.to_param
    end

    assert_redirected_to vocabulary_words_path
  end
end
