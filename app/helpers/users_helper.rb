module UsersHelper
	def phone_format(number)
		unless number.nil? || number.blank?
			if number.length < 11
		     	"(" + number[0..2] + ") " + number[3..5] + "-" + number[6..9]
		    else
				"(" + number[0..2] + ") " + number[3..5] + "-" + number[6..9] + " ext " + number[10..13]
		    end
	    else
	    	""
	    end
	end
end
