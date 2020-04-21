require 'securerandom'

class User

  attr_accessor :name, :surname, :email, :id_user

  def initialize( name, surname, email, id_user )
    @name = name
    @surname = surname
    @email = email
    @id_user = SecureRandom.hex(3)
  end
  # a = User.new( "Sergey", "sis", "dawd", :id_user  )
  # puts a.name
  # puts a.surname
  # puts a.email
  # puts a.id_user
end

class Survey

  attr_accessor :id_survey, :survey_name, :questions

  def initialize( survey_name, id_survey )
    @survey_name = survey_name
    @id_survey = SecureRandom.hex(3)
    @questions = []
  end

  def add_questions(question)
    @questions.push(question)
  end

  def show_question
    puts @questions
  end

  def show_question_with_variant
    @questions.map! do |question|
      puts "questions"
      puts question.text
      puts "variant"
      question.variants.map! do |variant|
        puts variant.text
      end
    end
  end


  # b = Survey.new( "what", :id_survey)
  # puts b.survey_name
  # puts b.id_survey
end

class Question

  attr_accessor :id_question, :text, :variants

  def initialize(id_question, text, variants)
    @id_question = SecureRandom.hex(3)
    @text = text
    @variants = []
  end

  def add_variants(variant)
    @variants.push(variant)
  end

  def delete_variant(delete_variant)
    @variants.delete_if do |variant|
      variant.id_question == delete_variant
      variant.text == delete_variant
    end
  end
end

class Variant
  attr_accessor :id_variant, :text, :random_variant

  def initialize( text, id_variant, random_variant )
    @text = text
    @id_variant = SecureRandom.hex(3)
    @random_variant = rand(1..10)
  end
end

class Answer
  attr_accessor :id_answer, :random_answer

  def initialize( id_answer, random_answer )
    @id_answer = SecureRandom.hex(3)
    @random_answer = random_answer
  end
end


puts 'Enter name, surname, email'
name = gets.chomp
surname = gets.chomp
email = gets.chomp
id = @id_user
user = User.new(name, surname, email, id)

puts 'Add survey'
survey_name = gets.chomp
id_survey = @id_survey
survey = Survey.new(survey_name, id_survey)

loop do
  puts 'Add question'
  text = gets.chomp
  id_question = @id_question
  variants = []
  break if text == 's'
  question = Question.new(text, id_question, variants)
  survey.add_questions(question)
  loop do
    puts 'Add variants'
    text = gets.chomp
    id_variant = @id_variant
    r = @random_variant
    break if text == 's'
    variant = Variant.new(text, id_variant, r)
    question.add_variants(variant)
  end
end

puts 'your test '

survey.questions.map! do |question|
  puts 'question:'
  puts question.text
  print 'id question'
  puts question.id_question
  puts 'variant:'
  question.variants.map! do |variant|
    puts variant.text
    print "variant id: "
    puts variant.id_variant
  end
end
