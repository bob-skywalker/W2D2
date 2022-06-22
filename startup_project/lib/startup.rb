require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(start_up)
        if self.funding  > start_up.funding
            return true
        else
            return false
        end
    end

    def hire(name, title)
        raise("error") unless
        self.valid_title?(title)
            @employees << Employee.new(name,title)
    end


    def size
        return @employees.length
    end

    def pay_employee(instance)
        @salaries.each do |title,salary|
            if title == instance.title
                if @funding > salary
                    instance.pay(salary)
                    @funding -= salary
                else
                    raise("error")
                end
            end
        end
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end


    def average_salary()
        sum = 0
        tot = 0
        @employees.each do |employee|
            if salaries.has_key?(employee.title)
                sum += salaries[employee.title]
                tot += 1
            end
        end
        return sum / tot
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(company)
        @funding += company.funding
        @employees += company.employees

        company.salaries.each do |title,salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        company.close
    end

end
