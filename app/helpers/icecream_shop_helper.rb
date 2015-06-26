module IcecreamShopHelper
	def mean(arr)
		if arr.length > 0
			return arr.inject { |sum, el| sum + el }.to_f / arr.size
		else
			return 0
		end
	end
end
