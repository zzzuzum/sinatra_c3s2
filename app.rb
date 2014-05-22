require 'sinatra'

# get '/' do 
#   output  = "<form method='post' action='/'>"
#   output += "<input type='text' name='user_name' placeholder='name'>"
#   output += "<input type='text' name='user_age' placeholder='age'>"
#   output += "<button type='submit'>Submit</button>"
#   output += "</form>"
# 
#   output
# end
# 
# post '/' do
#   name = params[:user_name]
#   age  = params[:user_age].to_i # to_i converts the string "5" to the integer 5 
# 
#   if age >= 18
#     output = "Hello #{name.capitalize}. Here's your drink."
#   else
#     output = "This bar isn't the place for you, #{name.capitalize}. You're too young."
#   end
# 
#   output += " <br><br><a href='/'>again</a>"
# 
#   output
# end

get '/' do
	erb :form
end

post '/' do
 @name = params[:user_name]
 @age  = params[:user_age].to_i
 @day  = params[:day].downcase
 @sex  = params[:sex]

 if @day =='tuesday' && @sex=='f' && @age>=18
     erb :ladies_night_accept
 else
 	if @day =='tuesday' && @sex=='m' 
		erb :ladies_night_reject
	else
		if @day !='tuesday' && @age >= 18 
			erb :drink
		else
			if  @age < 18
				erb :no_drink
			end		 
		end
	end
 end
end
