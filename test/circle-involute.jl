using Luxor, Test

pi = π

function paramCircle(t,r)
    return Point(r*cos(t),r*sin(t)) 
end

function drawCircle(radius)
    start = 0
    step = 0.001
    endT = 2π
    prevPoint = paramCircle(start, radius)
    newpath()
    for t in step:step:endT
        currPoint = paramCircle(t,radius)
        line(prevPoint,currPoint)
        prevPoint = currPoint
    end
    strokepath()
end

function involuteCircle(t,r,a)
    xOfT = r*(cos(t)+(t-a)*sin(t))
    yOfT = r*(sin(t)-(t-a)*cos(t))
    return Point(xOfT,yOfT) 
end


function drawInvolute(startRadian, radius; clockwise= true)
    start = startRadian
    if clockwise == true
        step = 0.001
        endT = startRadian+2*pi
    else
        step = -0.01
        endT = startRadian-2*pi
    end
    sethue("red")
    a = start
    prevPoint = involuteCircle(start,radius,a)
    newpath()
    for t in start+step:step:endT
        currPoint = involuteCircle(t,radius,a)
        line(prevPoint,currPoint)
        prevPoint = currPoint
    end
    strokepath()
end


function test_circleInvolute(fname)
    pagewidth, pageheight = 1200, 1400
    Drawing(pagewidth, pageheight, fname)
	origin()
	sethue("green")
	radius = 200
	radiusOffset = 50

	drawCircle(radius)
	sethue("blue")
	#drawCircle(radius+radiusOffset)

	rads = 0:pi/10:2*pi

	r = radius+radiusOffset+40

	for myrad in rads
		drawInvolute(myrad,radius)
		drawInvolute(myrad,radius,clockwise=false)
		#newpath()
		#sethue("black")
		#line(Point(0,0),Point(r*cos(myrad),r*sin(myrad)))
		#strokepath()
	end

	@test finish() == true
	println("...finished circle tangent test, saved in $(fname)")
end

fname = "circleInvolute_test.pdf"

test_circleInvolute(fname)
preview()
