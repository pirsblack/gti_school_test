

class User
  attr_accessor :name, :surname, :email, :user_id

  def initialize(name: nil, surname: nil, email: nil, user_id: 1)
    @name = name
    @surname = surname
    @email = email
    @user_id = user_id
  end

  def name
    @name
  end

  def surname
    @surname
  end

  def email
    @email
  end
end



user = User.new( name: "Sergey", email: "test@test.ts", surname: "Test" )
puts user.name
puts user #user id?
puts user.email
puts user.surname

# class Survey
#   attr_accessor :survey_id, :s_title, :enter_question, :list_questions
#
#   def initialize( survey_id: 2, s_title: nil, enter_question: nil, list_questions: nil )
#     @survey_id = survey_id
#     @s_title = s_title
#     @enter_question = enter_question
#     @list_question = list_questions
#   end
#
# end
# #
# #
# # puts b.user_id
# #