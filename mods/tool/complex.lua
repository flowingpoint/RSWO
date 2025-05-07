local math = require 'math'
local pi, sin, cos, atan2 = math.pi, math.sin, math.cos, math.atan2
local sqrt, exp, ln = math.sqrt, math.exp, math.log
local floor, abs = math.floor, math.abs

complex = {
	IMAGINARY_CHAR	= 'i',
	PREFIX			= false, -- use i / j as a prefix for serialisation.
	PARENTHESES		= false -- serialise complex numbers in parentheses.
}

function complex:new (r, i)
	self.__index = self
	return setmetatable (type (r) == 'table' and r or { r = r, i = i or 0 }, self)
end

setmetatable (complex, {
	__call = function (tbl, r, i)
		return complex:new (r, i)
	end }
)

complex.i = complex (0, 1)

function complex:__unm ()
	return complex (-self.r, -self.i)
end

local function re_im2 (z1, z2)
	return
		type (z1) == 'number' and z1 or z1.r,
		type (z1) == 'number' and 0 or z1.i,
		type (z2) == 'number' and z2 or z2.r,
		type (z2) == 'number' and 0 or z2.i
end

function complex:__add (addend)
	local re1, im1, re2, im2 = re_im2 (self, addend)
	return complex (re1 + re2, im1 + im2)
end

function complex:__sub (subtrahend)
	return self + (-subtrahend)
end

function complex:__mul (multiplicand)
	local re1, im1, re2, im2 = re_im2 (self, multiplicand)
	return complex (re1 * re2 - im1 * im2, im1 * re2 + re1 * im2)
end

function complex:conjugate ()
	return complex (self.r, -self.i)
end

function complex:__div (denominator)
	-- https://www.mesacc.edu/~scotz47781/mat120/notes/complex/dividing/dividing_complex.html
	local conjugate = type (denominator) == 'number' and complex (denominator) or denominator:conjugate ()
	local new_numerator, new_denominator = self * conjugate, denominator * conjugate
	-- new_denominator is real.
	return complex (new_numerator.r / new_denominator.r, new_numerator.i / new_denominator.r)
end

function complex:abs2 ()
	return self.r ^ 2 + self.i ^ 2
end

function complex:abs ()
	return sqrt (self:abs2 ())
end

function complex.polar (abs, arg)
	-- Special cases to remove fantom imaginary or real parts:
	return arg == 0			and complex (abs, 0)
		or arg == pi / 2	and complex (0, abs)
		or arg == pi		and complex (-abs, 0)
		or arg == pi * 1.5	and complex (0, -abs)
		or complex (abs * cos (arg), abs * sin (arg))
end

function complex:arg ()
	-- Special cases to remove fantom imaginary or real parts:
	return self.i == 0 and (self.r > 0 and 0 or pi)
		or self.r == 0 and (self.i > 0 and pi / 2 or -pi / 2)
		or atan2 (self.i, self.r)
end

function complex:exp ()
	local abs = exp (self.r)
	-- Special treatment for real numbers to avoid fantom imaginary parts:
	return self.i == 0 and abs or complex (abs * cos (self.i), abs * sin (self.i))
end
	
function complex:__pow (power)
	local re1, im1, re2, im2 = re_im2 (self, power)
	local x = im1 == 0 and re1 > 0 and re1 or nil
	if x then
		-- Euler:
		return complex (power * ln (x)):exp ()
	else
	-- de Moivre:
		local n = im2 == 0 and re2 or nil
		if n and floor (n) == n then
			local abs, arg = self:abs (), self:arg ()
			return complex.polar (abs ^ n, n * arg)
		end
	end
end

local unpack = unpack or table.unpack
function complex:roots (n)
	if n <= 1 then
		return self ^ -n
	end
	local values = {}
	local abs, arg = self:abs () ^ (1 / n), self:arg ()
	local double_pi = math.pi * 2
	for k = 0, n - 1 do
		values [k + 1] = complex.polar (abs, (arg + double_pi * k) / n)
	end
	return unpack (values)
end

function complex:__eq (other)
	local re1, im1, re2, im2 = re_im2 (self, other)
	return re1 == re2 and im1 == im2
end

function complex:__lt (other)
	local re1, im1, re2, im2 = re_im2 (self, other)
	-- incorrect but for sorting:
	return re1 < re2 or re1 == re2 and im1 < im2
end

function complex:tostring (i, prefix, parentheses)
	local im = type (i) == 'string' and i or 'i'
	local r, i = self.r, self.i

	local r_str = (r ~= 0 or i == 0) and r or ''
	local i_str = i ~= 0 and (prefix and im .. abs (i) or (abs (i) == 1 and '' or abs (i)) .. im) or ''
	local space = (r ~= 0 and i ~= 0) and ' ' or ''
	local sign = r ~= 0 and i > 0 and '+' or i < 0 and '-' or ''
	
	local str = r_str .. space .. sign .. space .. i_str
	if parentheses then
		str = '(' .. str .. ')'
	end
	return str
end

function complex:__tostring ()
	return self:tostring (self.IMAGINARY_CHAR, self.PREFIX, self.PARENTHESES)
end

return complex
