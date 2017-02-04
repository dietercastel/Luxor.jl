"""
    tiles = Tiler(areawidth, areaheight, nrows, ncols, margin=20)

A Tiler is an iterator that, for each iteration, returns a tuple of:

- the `x`/`y` point of the center of each tile in a set of tiles that divide up a
  rectangular space such as a page into rows and columns (relative to current 0/0)

- the number of the tile

`areawidth` and `areaheight` are the dimensions of the area to be tiled, `nrows`/`ncols`
are the number of rows and columns required, and `margin` is applied to all four
edges of the area before the function calculates the tile sizes required.

    tiles = Tiler(1000, 800, 4, 5, margin=20)
    for (pos, n) in tiles
    # the point pos is the center of the tile
    end

You can access the calculated tile width and height like this:

    tiles = Tiler(1000, 800, 4, 5, margin=20)
    for (pos, n) in tiles
      ellipse(pos.x, pos.y, tiles.tilewidth, tiles.tileheight, :fill)
    end
"""
type Tiler
    areawidth::Real
    areaheight::Real
    tilewidth::Real
    tileheight::Real
    nrows::Int
    ncols::Int
    margin::Real
    function Tiler(areawidth, areaheight, nrows::Int, ncols::Int; margin=10)
        tilewidth  = (areawidth - 2margin)/ncols
        tileheight = (areaheight - 2margin)/nrows
        new(areawidth, areaheight, tilewidth, tileheight, nrows, ncols, margin)
    end
end

function Base.start(pt::Tiler)
    # return the initial state
    x = -(pt.areawidth/2)  + pt.margin + (pt.tilewidth/2)
    y = -(pt.areaheight/2) + pt.margin + (pt.tileheight/2)
    return (Point(x, y), 1)
end

function Base.next(pt::Tiler, state)
    # Returns the item and the next state
    # state[1] is the Point
    x = state[1].x
    y = state[1].y
    # state[2] is the tilenumber
    tilenumber = state[2]
    x1 = x + pt.tilewidth
    y1 = y
    if x1 > (pt.areawidth/2) - pt.margin
        y1 += pt.tileheight
        x1 = -(pt.areawidth/2) + pt.margin + (pt.tilewidth/2)
    end
    return ((Point(x, y), tilenumber), (Point(x1, y1), tilenumber + 1))
end

function Base.done(pt::Tiler, state)
    # Tests if there are any items remaining
    state[2] > (pt.nrows * pt.ncols)
end

function Base.length(pt::Tiler)
    pt.nrows * pt.ncols
end

function Base.getindex(pt::Tiler, i::Int)
    1 <= i <= pt.ncols *  pt.nrows || throw(BoundsError(pt, i))
    xcoord = -pt.areawidth/2  + pt.margin + mod1(i, pt.ncols) * pt.tilewidth  - pt.tilewidth/2
    ycoord = -pt.areaheight/2 + pt.margin + (div(i - 1,  pt.ncols) * pt.tileheight) + pt.tileheight/2
    return (Point(xcoord, ycoord), i)
end

"""
    findnextgridpoint(pt::Point, xspacing, yspacing, width, height)

Return the next grid point.
"""
function findnextgridpoint(pt::Point, xspacing, yspacing, width, height)
    temp = Point(pt.x + xspacing, pt.y) 
    if temp.x >= width
        return Point(0, temp.y + yspacing)
    elseif temp.y >= height
        # what to do? Perhaps just start again...
        return Point(0, 0)
    else
        return temp
    end
end

"""
    setgrid(xspacing=100, yspacing=100, width=1200, height=1200)

Grid generation: this function returns a function that creates grid points. 
The grid starts at `0/0`, and proceeds along in the x-direction, and moves down
in the y-direction when the x coordinate current point exceeds the `width`.

    julia> grid = setgrid(400, 200, 400, 1200)
    (::nextgridpoint) (generic function with 1 method)
        
    julia> grid()
    Luxor.Point(0.0,0.0)
    
    julia> grid()
    Luxor.Point(400.0,0.0)
    
    julia> grid()
    Luxor.Point(0.0,200.0)
"""
function setgrid(xspacing=100, yspacing=100, width=1200, height=1200)
   pt = Point(-xspacing, 0)
   nextgridpoint() = pt = findnextgridpoint(pt, xspacing, yspacing, width, height)
   return nextgridpoint
end