class ApplicationController < ActionController::Base
    def blank_square_form
        render({ :template => "calculation_templates/square_form.html.erb"})
    end

    def blank_random_form
        render({ :template => "calculation_templates/random_form.html.erb"})
    end

    def blank_squareroot_form
        render({ :template => "calculation_templates/squareroot_form.html.erb"})
    end

    def blank_payment
        render({ :template => "calculation_templates/payment_form.html.erb"})
    end



    def calculate_square
        @num = params.fetch("input").to_f
        @square_of_num = @num ** 2
        #or @num * @num
        render({ :template => "calculation_templates/square_results.html.erb"})
    end

    def calculate_random
        @lower = params.fetch("random_input_min").to_f
        @upper = params.fetch("random_input_max").to_f
        @result = rand(@lower..@upper)

        render({ :template => "calculation_templates/random_results.html.erb"})
    end

    def calculate_squareroot
        @num_squareroot = params.fetch("sqrt_input").to_f
        @result_squareroot = @num_squareroot ** 0.5

        render({ :template => "calculation_templates/squareroot_results.html.erb"})
    end

    def calculate_payment
        @num_APR = params.fetch("APR_input").to_f
        @num_years = params.fetch("years_input").to_f
        @num_principal = params.fetch("principal_input").to_f
        @results_payment = @num_principal * (@num_APR/1200*((1+@num_APR/1200)**(@num_years*12))) / ((1+@num_APR/1200)**(@num_years*12)-1)

        render({ :template => "calculation_templates/payment_results.html.erb"})
    end

end
