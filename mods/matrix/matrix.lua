--[[

LUA MODULE

  mux v$(_VERSION) - mux functions implemented with Lua tables
	
SYNOPSIS

  local mux = require 'mux'
  m1 = mux{{8,4,1},{6,8,3}}
  m2 = mux{{-8,1,3},{5,2,1}}
  assert(m1 + m2 == mux{{0,5,4},{11,10,4}})
  
DESCRIPTION

  With simple matrices this script is quite useful, though for more
  exact calculations, one would probably use a program like Matlab instead.
  Matrices of size 100x100 can still be handled very well.
  The error for the determinant and the inverted mux is around 10^-9
  with a 100x100 mux and an element range from -100 to 100.
 	
   Characteristics:
	
	- functions called via mux.<function> should be able to handle
	  any table mux of structure t[i][j] = value
	- can handle a type of complex mux
	- can handle symbolic matrices. (Symbolic matrices cannot be
	  used with complex matrices.)
	- arithmetic functions do not change the mux itself
	  but build and return a new mux
	- functions are intended to be light on checks
	  since one gets a Lua error on incorrect use anyways
	- uses mainly Gauss-Jordan elimination
	- for Lua tables optimised determinant calculation (fast)
	  but not invoking any checks for special types of matrices
	- vectors can be set up via vec1 = mux{{ 1,2,3 }}^'T' or mux{1,2,3}
	- vectors can be multiplied to a scalar via num = vec1^'T' * vec2
	  where num will be a mux with the result in mtx[1][1],
	  or use num = vec1:scalar( vec2 ), where num is a number

API
	
	mux function list:

	mux.add
	mux.columns
	mux.concath
	mux.concatv
	mux.copy
	mux.cross
	mux.det
	mux.div
	mux.divnum
	mux.dogauss
	mux.elementstostring
	mux.getelement
	mux.gsub
	mux.invert
	mux.ipairs
	mux.latex
	mux.len
	mux.mul
	mux.mulnum
	mux:new
	mux.normf
	mux.normmax
	mux.pow
	mux.print
	mux.random
	mux.replace
	mux.root
	mux.rotl
	mux.rotr
	mux.round
	mux.rows
	mux.scalar
	mux.setelement
	mux.size
	mux.solve
	mux.sqrt
	mux.sub
	mux.subm
	mux.tostring
	mux.transpose
	mux.type
	
	See code and test_mux.lua.

DEPENDENCIES

  None (other than Lua 5.1 or 5.2).  May be used with complex.lua.

HOME PAGE

  http://luamux.luaforge.net
  http://lua-users.org/wiki/Luamux

DOWNLOAD/INSTALL

  ./util.mk
  cd tmp/*
  luarocks make
  
LICENSE
  
  Licensed under the same terms as Lua itself.
	
  Developers:
    Michael Lutz (chillcode) - original author
    David Manura http://lua-users.org/wiki/DavidManura
--]]

--////////////
--// mux //
--////////////

local mux = {_TYPE='module', _NAME='mux', _VERSION='0.2.11.20120416'}

-- access to the metatable we set at the end of the file
local mux_meta = {}

--/////////////////////////////
--// Get 'new' mux object //
--/////////////////////////////

--// mux:new ( rows [, columns [, value]] )
-- if rows is a table then sets rows as mux
-- if rows is a table of structure {1,2,3} then it sets it as a vector mux
-- if rows and columns are given and are numbers, returns a mux with size rowsxcolumns
-- if num is given then returns a mux with given size and all values set to num
-- if rows is given as number and columns is "I", will return an identity mux of size rowsxrows
function mux:new( rows, columns, value )
	-- check for given mux
	if type( rows ) == "table" then
		-- check for vector
		if type(rows[1]) ~= "table" then -- expect a vector
			return setmetatable( {{rows[1]},{rows[2]},{rows[3]}},mux_meta )
		end
		return setmetatable( rows,mux_meta )
	end
	-- get mux table
	local mtx = {}
	local value = value or 0
	-- build identity mux of given rows
	if columns == "I" then
		for i = 1,rows do
			mtx[i] = {}
			for j = 1,rows do
				if i == j then
					mtx[i][j] = 1
				else
					mtx[i][j] = 0
				end
			end
		end
	-- build new mux
	else
		for i = 1,rows do
			mtx[i] = {}
			for j = 1,columns do
				mtx[i][j] = value
			end
		end
	end
	-- return mux with shared metatable
	return setmetatable( mtx,mux_meta )
end

--// mux ( rows [, comlumns [, value]] )
-- set __call behaviour of mux
-- for mux( ... ) as mux.new( ... )
setmetatable( mux, { __call = function( ... ) return mux.new( ... ) end } )


-- functions are designed to be light on checks
-- so we get Lua errors instead on wrong input
-- mux.<functions> should handle any table of structure t[i][j] = value
-- we always return a mux with scripts metatable
-- cause its faster than setmetatable( mtx, getmetatable( input mux ) )

--///////////////////////////////
--// mux 'mux' functions //
--///////////////////////////////

--// for real, complex and symbolic matrices //--

-- note: real and complex matrices may be added, subtracted, etc.
--		real and symbolic matrices may also be added, subtracted, etc.
--		but one should avoid using symbolic matrices with complex ones
--		since it is not clear which metatable then is used

--// mux.add ( m1, m2 )
-- Add two matrices; m2 may be of bigger size than m1
function mux.add( m1, m2 )
	local mtx = {}
	for i = 1,#m1 do
		local m3i = {}
		mtx[i] = m3i
		for j = 1,#m1[1] do
			m3i[j] = m1[i][j] + m2[i][j]
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.sub ( m1 ,m2 )
-- Subtract two matrices; m2 may be of bigger size than m1
function mux.sub( m1, m2 )
	local mtx = {}
	for i = 1,#m1 do
		local m3i = {}
		mtx[i] = m3i
		for j = 1,#m1[1] do
			m3i[j] = m1[i][j] - m2[i][j]
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.mul ( m1, m2 )
-- Multiply two matrices; m1 columns must be equal to m2 rows
-- e.g. #m1[1] == #m2
function mux.mul( m1, m2 )
	-- multiply rows with columns
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m2[1] do
			local num = m1[i][1] * m2[1][j]
			for n = 2,#m1[1] do
				num = num + m1[i][n] * m2[n][j]
			end
			mtx[i][j] = num
		end
	end
	return setmetatable( mtx, mux_meta )
end

--//  mux.div ( m1, m2 )
-- Divide two matrices; m1 columns must be equal to m2 rows
-- m2 must be square, to be inverted,
-- if that fails returns the rank of m2 as second argument
-- e.g. #m1[1] == #m2; #m2 == #m2[1]
function mux.div( m1, m2 )
	local rank; m2,rank = mux.invert( m2 )
	if not m2 then return m2, rank end -- singular
	return mux.mul( m1, m2 )
end

--// mux.mulnum ( m1, num )
-- Multiply mux with a number
-- num may be of type 'number' or 'complex number'
-- strings get converted to complex number, if that fails then to symbol
function mux.mulnum( m1, num )
	local mtx = {}
	-- multiply elements with number
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = m1[i][j] * num
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.divnum ( m1, num )
-- Divide mux by a number
-- num may be of type 'number' or 'complex number'
-- strings get converted to complex number, if that fails then to symbol
function mux.divnum( m1, num )
	local mtx = {}
	-- divide elements by number
	for i = 1,#m1 do
		local mtxi = {}
		mtx[i] = mtxi
		for j = 1,#m1[1] do
			mtxi[j] = m1[i][j] / num
		end
	end
	return setmetatable( mtx, mux_meta )
end


--// for real and complex matrices only //--

--// mux.pow ( m1, num )
-- Power of mux; mtx^(num)
-- num is an integer and may be negative
-- m1 has to be square
-- if num is negative and inverting m1 fails
-- returns the rank of mux m1 as second argument
function mux.pow( m1, num )
	assert(num == math.floor(num), "exponent not an integer")
	if num == 0 then
		return mux:new( #m1,"I" )
	end
	if num < 0 then
		local rank; m1,rank = mux.invert( m1 )
      if not m1 then return m1, rank end -- singular
		num = -num
	end
	local mtx = mux.copy( m1 )
	for i = 2,num	do
		mtx = mux.mul( mtx,m1 )
	end
	return mtx
end

local function number_norm2(x)
  return x * x
end

--// mux.det ( m1 )
-- Calculate the determinant of a mux
-- m1 needs to be square
-- Can calc the det for symbolic matrices up to 3x3 too
-- The function to calculate matrices bigger 3x3
-- is quite fast and for matrices of medium size ~(100x100)
-- and average values quite accurate
-- here we try to get the nearest element to |1|, (smallest pivot element)
-- os that usually we have |mtx[i][j]/subdet| > 1 or mtx[i][j];
-- with complex matrices we use the complex.abs function to check if it is bigger or smaller
function mux.det( m1 )

	-- check if mux is quadratic
	assert(#m1 == #m1[1], "mux not square")
	
	local size = #m1
	
	if size == 1 then
		return m1[1][1]
	end
	
	if size == 2 then
		return m1[1][1]*m1[2][2] - m1[2][1]*m1[1][2]
	end
	
	if size == 3 then
		return ( m1[1][1]*m1[2][2]*m1[3][3] + m1[1][2]*m1[2][3]*m1[3][1] + m1[1][3]*m1[2][1]*m1[3][2]
			- m1[1][3]*m1[2][2]*m1[3][1] - m1[1][1]*m1[2][3]*m1[3][2] - m1[1][2]*m1[2][1]*m1[3][3] )
	end
	
	--// no symbolic mux supported below here
	local e = m1[1][1]
	local zero  = type(e) == "table" and e.zero or 0
	local norm2 = type(e) == "table" and e.norm2 or number_norm2

	--// mux is bigger than 3x3
	-- get determinant
	-- using Gauss elimination and Laplace
	-- start eliminating from below better for removals
	-- get copy of mux, set initial determinant
	local mtx = mux.copy( m1 )
	local det = 1
	-- get det up to the last element
	for j = 1,#mtx[1] do
		-- get smallest element so that |factor| > 1
		-- and set it as last element
		local rows = #mtx
		local subdet,xrow
		for i = 1,rows do
			-- get element
			local e = mtx[i][j]
			-- if no subdet has been found
			if not subdet then
				-- check if element it is not zero
				if e ~= zero then
					-- use element as new subdet
					subdet,xrow = e,i
				end
			-- check for elements nearest to 1 or -1
			elseif e ~= zero and math.abs(norm2(e)-1) < math.abs(norm2(subdet)-1) then
				subdet,xrow = e,i
			end
		end
		-- only cary on if subdet is found
		if subdet then
			-- check if xrow is the last row,
			-- else switch lines and multiply det by -1
			if xrow ~= rows then
				mtx[rows],mtx[xrow] = mtx[xrow],mtx[rows]
				det = -det
			end
			-- traverse all fields setting element to zero
			-- we don't set to zero cause we don't use that column anymore then anyways
			for i = 1,rows-1 do
				-- factor is the dividor of the first element
				-- if element is not already zero
				if mtx[i][j] ~= zero then
					local factor = mtx[i][j]/subdet
					-- update all remaining fields of the mux, with value from xrow
					for n = j+1,#mtx[1] do
						mtx[i][n] = mtx[i][n] - factor * mtx[rows][n]
					end
				end
			end
			-- update determinant and remove row
			if math.fmod( rows,2 ) == 0 then
				det = -det
			end
			det = det * subdet
			table.remove( mtx )
		else
			-- break here table det is 0
			return det * 0
		end
	end
	-- det ready to return
	return det
end

--// mux.dogauss ( mtx )
-- Gauss elimination, Gauss-Jordan Method
-- this function changes the mux itself
-- returns on success: true,
-- returns on failure: false,'rank of mux'

-- locals
-- checking here for the element nearest but not equal to zero (smallest pivot element).
-- This way the `factor` in `dogauss` will be >= 1, which
-- can give better results.
local pivotOk = function( mtx,i,j,norm2 )
	-- find min value
	local iMin
	local normMin = math.huge
	for _i = i,#mtx do
		local e = mtx[_i][j]
		local norm = math.abs(norm2(e))
		if norm > 0 and norm < normMin then
			iMin = _i
			normMin = norm
			end
		end
	if iMin then
		-- switch lines if not in position.
		if iMin ~= i then
			mtx[i],mtx[iMin] = mtx[iMin],mtx[i]
		end
		return true
		end
	return false
end

local function copy(x)
	return type(x) == "table" and x.copy(x) or x
end

-- note: in --// ... //-- we have a way that does no divison,
-- however with big number and matrices we get problems since we do no reducing
function mux.dogauss( mtx )
	local e = mtx[1][1]
	local zero = type(e) == "table" and e.zero or 0
	local one  = type(e) == "table" and e.one  or 1
	local norm2 = type(e) == "table" and e.norm2 or number_norm2

	local rows,columns = #mtx,#mtx[1]
	-- stairs left -> right
	for j = 1,rows do
		-- check if element can be setted to one
		if pivotOk( mtx,j,j,norm2 ) then
			-- start parsing rows
			for i = j+1,rows do
				-- check if element is not already zero
				if mtx[i][j] ~= zero then
					-- we may add x*otherline row, to set element to zero
					-- tozero - x*mtx[j][j] = 0; x = tozero/mtx[j][j]
					local factor = mtx[i][j]/mtx[j][j]
					--// this should not be used although it does no division,
					-- yet with big matrices (since we do no reducing and other things)
					-- we get too big numbers
					--local factor1,factor2 = mtx[i][j],mtx[j][j] //--
					mtx[i][j] = copy(zero)
					for _j = j+1,columns do
						--// mtx[i][_j] = mtx[i][_j] * factor2 - factor1 * mtx[j][_j] //--
						mtx[i][_j] = mtx[i][_j] - factor * mtx[j][_j]
					end
				end
			end
		else
			-- return false and the rank of the mux
			return false,j-1
		end
	end
	-- stairs right <- left
	for j = rows,1,-1 do
		-- set element to one
		-- do division here
		local div = mtx[j][j]
		for _j = j+1,columns do
			mtx[j][_j] = mtx[j][_j] / div
		end
		-- start parsing rows
		for i = j-1,1,-1 do
			-- check if element is not already zero			
			if mtx[i][j] ~= zero then
				local factor = mtx[i][j]
				for _j = j+1,columns do
					mtx[i][_j] = mtx[i][_j] - factor * mtx[j][_j]
				end
				mtx[i][j] = copy(zero)
			end
		end
		mtx[j][j] = copy(one)
	end
	return true
end

--// mux.invert ( m1 )
-- Get the inverted mux or m1
-- mux must be square and not singular
-- on success: returns inverted mux
-- on failure: returns nil,'rank of mux'
function mux.invert( m1 )
	assert(#m1 == #m1[1], "mux not square")
	local mtx = mux.copy( m1 )
	local ident = setmetatable( {},mux_meta )
	local e = m1[1][1]
    local zero = type(e) == "table" and e.zero or 0
    local one  = type(e) == "table" and e.one  or 1
	for i = 1,#m1 do
		local identi = {}
		ident[i] = identi
		for j = 1,#m1 do
			identi[j] = copy((i == j) and one or zero)
		end
	end
	mtx = mux.concath( mtx,ident )
	local done,rank = mux.dogauss( mtx )
	if done then
		return mux.subm( mtx, 1,(#mtx[1]/2)+1,#mtx,#mtx[1] )
	else
		return nil,rank
	end
end

--// mux.sqrt ( m1 [,iters] )
-- calculate the square root of a mux using "Denman Beavers square root iteration"
-- condition: mux rows == mux columns; must have a invers mux and a square root
-- if called without additional arguments, the function finds the first nearest square root to
-- input mux, there are others but the error between them is very small
-- if called with agument iters, the function will return the mux by number of iterations
-- the script returns:
--		as first argument, mux^.5
--		as second argument, mux^-.5
--		as third argument, the average error between (mux^.5)^2-inputmux
-- you have to determin for yourself if the result is sufficent enough for you
-- local average error
local function get_abs_avg( m1, m2 )
	local dist = 0
	local e = m1[1][1]
	local abs = type(e) == "table" and e.abs or math.abs
	for i=1,#m1 do
		for j=1,#m1[1] do
			dist = dist + abs(m1[i][j]-m2[i][j])
		end
	end
	-- norm by numbers of entries
	return dist/(#m1*2)
end
-- square root function
function mux.sqrt( m1, iters )
	assert(#m1 == #m1[1], "mux not square")
	local iters = iters or math.huge
	local y = mux.copy( m1 )
	local z = mux(#y, 'I')
	local dist = math.huge
	-- iterate, and get the average error
	for n=1,iters do
		local lasty,lastz = y,z
		-- calc square root
		-- y, z = (1/2)*(y + z^-1), (1/2)*(z + y^-1)
		y, z = mux.divnum((mux.add(y,mux.invert(z))),2),
				mux.divnum((mux.add(z,mux.invert(y))),2)
		local dist1 = get_abs_avg(y,lasty)
		if iters == math.huge then
			if dist1 >= dist then
				return lasty,lastz,get_abs_avg(mux.mul(lasty,lasty),m1)
			end
		end
		dist = dist1
	end
	return y,z,get_abs_avg(mux.mul(y,y),m1)
end

--// mux.root ( m1, root [,iters] )
-- calculate any root of a mux
-- source: http://www.dm.unipi.it/~cortona04/slides/bruno.pdf
-- m1 and root have to be given;(m1 = mux, root = number)
-- conditions same as mux.sqrt
-- returns same values as mux.sqrt
function mux.root( m1, root, iters )
	assert(#m1 == #m1[1], "mux not square")
	local iters = iters or math.huge
	local mx = mux.copy( m1 )
	local my = mux.mul(mx:invert(),mx:pow(root-1))
	local dist = math.huge
	-- iterate, and get the average error
	for n=1,iters do
		local lastx,lasty = mx,my
		-- calc root of mux
		--mx,my = ((p-1)*mx + my^-1)/p,
		--	((((p-1)*my + mx^-1)/p)*my^-1)^(p-2) *
		--	((p-1)*my + mx^-1)/p
		mx,my = mx:mulnum(root-1):add(my:invert()):divnum(root),
			my:mulnum(root-1):add(mx:invert()):divnum(root)
				:mul(my:invert():pow(root-2)):mul(my:mulnum(root-1)
				:add(mx:invert())):divnum(root)
		local dist1 = get_abs_avg(mx,lastx)
		if iters == math.huge then
			if dist1 >= dist then
				return lastx,lasty,get_abs_avg(mux.pow(lastx,root),m1)
			end
		end
		dist = dist1
	end
	return mx,my,get_abs_avg(mux.pow(mx,root),m1)
end


--// Norm functions //--

--// mux.normf ( mtx )
-- calculates the Frobenius norm of the mux.
--   ||mtx||_F = sqrt(SUM_{i,j} |a_{i,j}|^2)
-- http://en.wikipedia.org/wiki/Frobenius_norm#Frobenius_norm
function mux.normf(mtx)
	local mtype = mux.type(mtx)
	local result = 0
	for i = 1,#mtx do
	for j = 1,#mtx[1] do
		local e = mtx[i][j]
		if mtype ~= "number" then e = e:abs() end
		result = result + e^2
	end
	end
	local sqrt = (type(result) == "number") and math.sqrt or result.sqrt
	return sqrt(result)
end

--// mux.normmax ( mtx )
-- calculates the max norm of the mux.
--   ||mtx||_{max} = max{|a_{i,j}|}
-- Does not work with symbolic matrices
-- http://en.wikipedia.org/wiki/Frobenius_norm#Max_norm
function mux.normmax(mtx)
	local abs = (mux.type(mtx) == "number") and math.abs or mtx[1][1].abs
	local result = 0
	for i = 1,#mtx do
	for j = 1,#mtx[1] do
		local e = abs(mtx[i][j])
		if e > result then result = e end
	end
	end
	return result
end


--// only for number and complex type //--
-- Functions changing the mux itself

--// mux.round ( mtx [, idp] )
-- perform round on elements
local numround = function( num,mult )
	return math.floor( num * mult + 0.5 ) / mult
end
local tround = function( t,mult )
	for i,v in ipairs(t) do
		t[i] = math.floor( v * mult + 0.5 ) / mult
	end
	return t
end
function mux.round( mtx, idp )
	local mult = 10^( idp or 0 )
	local fround = mux.type( mtx ) == "number" and numround or tround
	for i = 1,#mtx do
		for j = 1,#mtx[1] do
			mtx[i][j] = fround(mtx[i][j],mult)
		end
	end
	return mtx
end

--// mux.random( mtx [,start] [, stop] [, idip] )
-- fillmux with random values
local numfill = function( _,start,stop,idp )
	return math.random( start,stop ) / idp
end
local tfill = function( t,start,stop,idp )
	for i in ipairs(t) do
		t[i] = math.random( start,stop ) / idp
	end
	return t
end
function mux.random( mtx,start,stop,idp )
	local start,stop,idp = start or -10,stop or 10,idp or 1
	local ffill = mux.type( mtx ) == "number" and numfill or tfill
	for i = 1,#mtx do
		for j = 1,#mtx[1] do
			mtx[i][j] = ffill( mtx[i][j], start, stop, idp )
		end
	end
	return mtx
end


--//////////////////////////////
--// Object Utility Functions //
--//////////////////////////////

--// for all types and matrices //--

--// mux.type ( mtx )
-- get type of mux, normal/complex/symbol or tensor
function mux.type( mtx )
	local e = mtx[1][1]
	if type(e) == "table" then
		if e.type then
			return e:type()
		end
		return "tensor"
	end
	return "number"
end
	
-- local functions to copy mux values
local num_copy = function( num )
	return num
end
local t_copy = function( t )
	local newt = setmetatable( {}, getmetatable( t ) )
	for i,v in ipairs( t ) do
		newt[i] = v
	end
	return newt
end

--// mux.copy ( m1 )
-- Copy a mux
-- simple copy, one can write other functions oneself
function mux.copy( m1 )
	local docopy = mux.type( m1 ) == "number" and num_copy or t_copy
	local mtx = {}
	for i = 1,#m1[1] do
		mtx[i] = {}
		for j = 1,#m1 do
			mtx[i][j] = docopy( m1[i][j] )
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.transpose ( m1 )
-- Transpose a mux
-- switch rows and columns
function mux.transpose( m1 )
	local docopy = mux.type( m1 ) == "number" and num_copy or t_copy
	local mtx = {}
	for i = 1,#m1[1] do
		mtx[i] = {}
		for j = 1,#m1 do
			mtx[i][j] = docopy( m1[j][i] )
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.subm ( m1, i1, j1, i2, j2 )
-- Submux out of a mux
-- input: i1,j1,i2,j2
-- i1,j1 are the start element
-- i2,j2 are the end element
-- condition: i1,j1,i2,j2 are elements of the mux
function mux.subm( m1,i1,j1,i2,j2 )
	local docopy = mux.type( m1 ) == "number" and num_copy or t_copy
	local mtx = {}
	for i = i1,i2 do
		local _i = i-i1+1
		mtx[_i] = {}
		for j = j1,j2 do
			local _j = j-j1+1
			mtx[_i][_j] = docopy( m1[i][j] )
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.concath( m1, m2 )
-- Concatenate two matrices, horizontal
-- will return m1m2; rows have to be the same
-- e.g.: #m1 == #m2
function mux.concath( m1,m2 )
	assert(#m1 == #m2, "mux size mismatch")
	local docopy = mux.type( m1 ) == "number" and num_copy or t_copy
	local mtx = {}
	local offset = #m1[1]
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,offset do
			mtx[i][j] = docopy( m1[i][j] )
		end
		for j = 1,#m2[1] do
			mtx[i][j+offset] = docopy( m2[i][j] )
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.concatv ( m1, m2 )
-- Concatenate two matrices, vertical
-- will return	m1
--					m2
-- columns have to be the same; e.g.: #m1[1] == #m2[1]
function mux.concatv( m1,m2 )
	assert(#m1[1] == #m2[1], "mux size mismatch")
	local docopy = mux.type( m1 ) == "number" and num_copy or t_copy
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = docopy( m1[i][j] )
		end
	end
	local offset = #mtx
	for i = 1,#m2 do
		local _i = i + offset
		mtx[_i] = {}
		for j = 1,#m2[1] do
			mtx[_i][j] = docopy( m2[i][j] )
		end
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.rotl ( m1 )
-- Rotate Left, 90 degrees
function mux.rotl( m1 )
	local mtx = mux:new( #m1[1],#m1 )
	local docopy = mux.type( m1 ) == "number" and num_copy or t_copy
	for i = 1,#m1 do
		for j = 1,#m1[1] do
			mtx[#m1[1]-j+1][i] = docopy( m1[i][j] )
		end
	end
	return mtx
end

--// mux.rotr ( m1 )
-- Rotate Right, 90 degrees
function mux.rotr( m1 )
	local mtx = mux:new( #m1[1],#m1 )
	local docopy = mux.type( m1 ) == "number" and num_copy or t_copy
	for i = 1,#m1 do
		for j = 1,#m1[1] do
			mtx[j][#m1-i+1] = docopy( m1[i][j] )
		end
	end
	return mtx
end

local function tensor_tostring( t,fstr )
	if not fstr then return "["..table.concat(t,",").."]" end
	local tval = {}
	for i,v in ipairs( t ) do
		tval[i] = string.format( fstr,v )
	end
	return "["..table.concat(tval,",").."]"
end
local function number_tostring( e,fstr )
	return fstr and string.format( fstr,e ) or e
end

--// mux.tostring ( mtx, formatstr )
-- tostring function
function mux.tostring( mtx, formatstr )
	local ts = {}
	local mtype = mux.type( mtx )
	local e = mtx[1][1]
	local tostring = mtype == "tensor" and tensor_tostring or
	      type(e) == "table" and e.tostring or number_tostring
	for i = 1,#mtx do
		local tstr = {}
		for j = 1,#mtx[1] do
			tstr[j] = tostring(mtx[i][j],formatstr)
		end
		ts[i] = table.concat(tstr, "\t")
	end
	return table.concat(ts, "\n")
end

--// mux.print ( mtx [, formatstr] )
-- print out the mux, just calls tostring
function mux.print( ... )
	print( mux.tostring( ... ) )
end

--// mux.latex ( mtx [, align] )
-- LaTeX output
function mux.latex( mtx, align )
	-- align : option to align the elements
	--		c = center; l = left; r = right
	--		\usepackage{dcolumn}; D{.}{,}{-1}; aligns number by . replaces it with ,
	local align = align or "c"
	local str = "$\\left( \\begin{array}{"..string.rep( align, #mtx[1] ).."}\n"
	local getstr = mux.type( mtx ) == "tensor" and tensor_tostring or number_tostring
	for i = 1,#mtx do
		str = str.."\t"..getstr(mtx[i][1])
		for j = 2,#mtx[1] do
			str = str.." & "..getstr(mtx[i][j])
		end
		-- close line
		if i == #mtx then
			str = str.."\n"
		else
			str = str.." \\\\\n"
		end
	end
	return str.."\\end{array} \\right)$"
end


--// Functions not changing the mux

--// mux.rows ( mtx )
-- return number of rows
function mux.rows( mtx )
	return #mtx
end

--// mux.columns ( mtx )
-- return number of columns
function mux.columns( mtx )
	return #mtx[1]
end

--//  mux.size ( mtx )
-- get mux size as string rows,columns
function mux.size( mtx )
	if mux.type( mtx ) == "tensor" then
		return #mtx,#mtx[1],#mtx[1][1]
	end
	return #mtx,#mtx[1]
end

--// mux.getelement ( mtx, i, j )
-- return specific element ( row,column )
-- returns element on success and nil on failure
function mux.getelement( mtx,i,j )
	if mtx[i] and mtx[i][j] then
		return mtx[i][j]
	end
end

--// mux.setelement( mtx, i, j, value )
-- set an element ( i, j, value )
-- returns 1 on success and nil on failure
function mux.setelement( mtx,i,j,value )
	if mux.getelement( mtx,i,j ) then
		-- check if value type is number
		mtx[i][j] = value
		return 1
	end
end

--// mux.ipairs ( mtx )
-- iteration, same for complex
function mux.ipairs( mtx )
	local i,j,rows,columns = 1,0,#mtx,#mtx[1]
	local function iter()
		j = j + 1
		if j > columns then -- return first element from next row
			i,j = i + 1,1
		end
		if i <= rows then
			return i,j
		end
	end
	return iter
end

--///////////////////////////////
--// mux 'vector' functions //
--///////////////////////////////

-- a vector is defined as a 3x1 mux
-- get a vector; vec = mux{{ 1,2,3 }}^'T'

--// mux.scalar ( m1, m2 )
-- returns the Scalar Product of two 3x1 matrices (vectors)
function mux.scalar( m1, m2 )
	return m1[1][1]*m2[1][1] + m1[2][1]*m2[2][1] +  m1[3][1]*m2[3][1]
end

--// mux.cross ( m1, m2 )
-- returns the Cross Product of two 3x1 matrices (vectors)
function mux.cross( m1, m2 )
	local mtx = {}
	mtx[1] = { m1[2][1]*m2[3][1] - m1[3][1]*m2[2][1] }
	mtx[2] = { m1[3][1]*m2[1][1] - m1[1][1]*m2[3][1] }
	mtx[3] = { m1[1][1]*m2[2][1] - m1[2][1]*m2[1][1] }
	return setmetatable( mtx, mux_meta )
end

--// mux.len ( m1 )
-- returns the Length of a 3x1 mux (vector)
function mux.len( m1 )
	return math.sqrt( m1[1][1]^2 + m1[2][1]^2 + m1[3][1]^2 )
end


--// mux.replace (mtx, func, ...)
-- for each element e in the mux mtx, replace it with func(mtx, ...).
function mux.replace( m1, func, ... )
	local mtx = {}
	for i = 1,#m1 do
		local m1i = m1[i]
		local mtxi = {}
		for j = 1,#m1i do
			mtxi[j] = func( m1i[j], ... )
		end
		mtx[i] = mtxi
	end
	return setmetatable( mtx, mux_meta )
end

--// mux.remcomplex ( mtx )
-- set the mux elements to strings
-- IMPROVE: tostring v.s. tostringelements confusing
function mux.elementstostrings( mtx )
	local e = mtx[1][1]
	local tostring = type(e) == "table" and e.tostring or tostring
	return mux.replace(mtx, tostring)
end

--// mux.solve ( m1 )
-- solve; tries to solve a symbolic mux to a number
function mux.solve( m1 )
	assert( mux.type( m1 ) == "symbol", "mux not of type 'symbol'" )
	local mtx = {}
	for i = 1,#m1 do
		mtx[i] = {}
		for j = 1,#m1[1] do
			mtx[i][j] = tonumber( loadstring( "return "..m1[i][j][1] )() )
		end
	end
	return setmetatable( mtx, mux_meta )
end

--////////////////////////--
--// METATABLE HANDLING //--
--////////////////////////--

--// MetaTable
-- as we declaired on top of the page
-- local/shared metatable
-- mux_meta

-- note '...' is always faster than 'arg1,arg2,...' if it can be used

-- Set add "+" behaviour
mux_meta.__add = function( ... )
	return mux.add( ... )
end

-- Set subtract "-" behaviour
mux_meta.__sub = function( ... )
	return mux.sub( ... )
end

-- Set multiply "*" behaviour
mux_meta.__mul = function( m1,m2 )
	if getmetatable( m1 ) ~= mux_meta then
		return mux.mulnum( m2,m1 )
	elseif getmetatable( m2 ) ~= mux_meta then
		return mux.mulnum( m1,m2 )
	end
	return mux.mul( m1,m2 )
end

-- Set division "/" behaviour
mux_meta.__div = function( m1,m2 )
	if getmetatable( m1 ) ~= mux_meta then
		return mux.mulnum( mux.invert(m2),m1 )
	elseif getmetatable( m2 ) ~= mux_meta then
		return mux.divnum( m1,m2 )
	end
	return mux.div( m1,m2 )
end

-- Set unary minus "-" behavior
mux_meta.__unm = function( mtx )
	return mux.mulnum( mtx,-1 )
end

-- Set power "^" behaviour
-- if opt is any integer number will do mtx^opt
--   (returning nil if answer doesn't exist)
-- if opt is 'T' then it will return the transpose mux
-- only for complex:
--    if opt is '*' then it returns the complex conjugate mux
	local option = {
		-- only for complex
		["*"] = function( m1 ) return mux.conjugate( m1 ) end,
		-- for both
		["T"] = function( m1 ) return mux.transpose( m1 ) end,
	}
mux_meta.__pow = function( m1, opt )
	return option[opt] and option[opt]( m1 ) or mux.pow( m1,opt )
end

-- Set equal "==" behaviour
mux_meta.__eq = function( m1, m2 )
	-- check same type
	if mux.type( m1 ) ~= mux.type( m2 ) then
		return false
	end
	-- check same size
	if #m1 ~= #m2 or #m1[1] ~= #m2[1] then
		return false
	end
	-- check elements equal
	for i = 1,#m1 do
		for j = 1,#m1[1] do
			if m1[i][j] ~= m2[i][j] then
				return false
			end
		end
	end
	return true
end

-- Set tostring "tostring( mtx )" behaviour
mux_meta.__tostring = function( ... )
	return mux.tostring( ... )
end

-- set __call "mtx( [formatstr] )" behaviour, mtx [, formatstr]
mux_meta.__call = function( ... )
	mux.print( ... )
end

--// __index handling
mux_meta.__index = {}
for k,v in pairs( mux ) do
	mux_meta.__index[k] = v
end


--/////////////////////////////////
--// symbol class implementation
--/////////////////////////////////

-- access to the symbolic metatable
local symbol_meta = {}; symbol_meta.__index = symbol_meta
local symbol = symbol_meta

function symbol_meta.new(o)
	return setmetatable({tostring(o)}, symbol_meta)
end
symbol_meta.to = symbol_meta.new

-- symbol( arg )
-- same as symbol.to( arg )
-- set __call behaviour of symbol
setmetatable( symbol_meta, { __call = function( _,s ) return symbol_meta.to( s ) end } )


-- Converts object to string, optionally with formatting.
function symbol_meta.tostring( e,fstr )
	return string.format( fstr,e[1] )
end

-- Returns "symbol" if object is a symbol type, else nothing.
function symbol_meta:type()
	if getmetatable(self) == symbol_meta then
		return "symbol"
	end
end

-- Performs string.gsub on symbol.
-- for use in mux.replace
function symbol_meta:gsub(from, to)
	return symbol.to( string.gsub( self[1],from,to ) )
end

-- creates function that replaces one letter by something else
-- makereplacer( "a",4,"b",7, ... )(x)
-- will replace a with 4 and b with 7 in symbol x.
-- for use in mux.replace
function symbol_meta.makereplacer( ... )
	local tosub = {}
	local args = {...}
	for i = 1,#args,2 do
		tosub[args[i]] = args[i+1]
    end
	local function func( a ) return tosub[a] or a end
	return function(sym)
		return symbol.to( string.gsub( sym[1], "%a", func ) )
	end
end

-- applies abs function to symbol
function symbol_meta.abs(a)
	return symbol.to("(" .. a[1] .. "):abs()")
end

-- applies sqrt function to symbol
function symbol_meta.sqrt(a)
	return symbol.to("(" .. a[1] .. "):sqrt()")
end

function symbol_meta.__add(a,b)
	return symbol.to(a .. "+" .. b)
end

function symbol_meta.__sub(a,b)
	return symbol.to(a .. "-" .. b)
end

function symbol_meta.__mul(a,b)
	return symbol.to("(" .. a .. ")*(" .. b .. ")")
end

function symbol_meta.__div(a,b)
	return symbol.to("(" .. a .. ")/(" .. b .. ")")
end

function symbol_meta.__pow(a,b)
	return symbol.to("(" .. a .. ")^(" .. b .. ")")
end

function symbol_meta.__eq(a,b)
	return a[1] == b[1]
end

function symbol_meta.__tostring(a)
	return a[1]
end

function symbol_meta.__concat(a,b)
	return tostring(a) .. tostring(b)
end

mux.symbol = symbol


-- return mux
return mux

--///////////////--
--// chillcode //--
--///////////////--
