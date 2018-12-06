def translate_single(p1)
	p1 + "yay" if "aeiou".include?(p1[0])
	until "aeiou".include?(p1[0])
		p1 = p1.chars.rotate!.join
		if p1[-1].downcase == "q" && p1[0].downcase == "u"
			p1 = p1.chars.rotate!.join
		end
	end
	p1 + "ay"
end

def translate(p1)
	(p1.split.map {|x| translate_single(x) }).join(" ")
end