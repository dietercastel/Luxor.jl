![splash image](docs/src/assets/figures/luxor-big-logo.png)

| **Documentation**                       | [**Package Evaluator**][pkgeval-link] | **Build Status**                          | **Code Coverage**               |
|:---------------------------------------:|:-------------------------------------:|:-----------------------------------------:|:-------------------------------:|
| [![][docs-stable-img]][docs-stable-url] | [![][pkg-0.5-img]][pkg-0.5-url]       | [![Build Status][travis-img]][travis-url] | [![][codecov-img]][codecov-url] |
| [![][docs-latest-img]][docs-latest-url] | [![][pkg-0.6-img]][pkg-0.6-url]       | [![Build Status][appvey-img]][appvey-url] |                                 |

## Status as of 2018-08-04

Compatible with Julia v0.7 release candidate 2. If you can install Cairo successfully, you should be OK.

[![][pkg-0.7-img]][pkg-0.7-url]

## Luxor

Luxor is a Julia package for drawing simple static vector graphics. It provides basic drawing functions and utilities for working with shapes, polygons, clipping masks, PNG images, turtle graphics, animations, and shapefiles. Think of it as a high-level and slightly easier to use interface to [Cairo.jl](https://github.com/JuliaLang/Cairo.jl), with shorter names, fewer underscores, default contexts, and simplified functions. In Luxor, the emphasis is on simplicity and ease of use.  

Luxor is thoroughly procedural and static: your code issues a sequence of simple graphics 'commands' until you've completed a drawing, then the results are saved into a PDF, PNG, SVG, or EPS file.

There are some Luxor-related videos on [YouTube](https://www.youtube.com/channel/UCfd52kTA5JpzOEItSqXLQxg). A short tutorial can be found in the latest version of the documentation.

Luxor isn't interactive: for interactive graphics, look at [Gtk.jl](https://github.com/JuliaGraphics/Gtk.jl), and [GLVisualize](https://github.com/JuliaGL/GLVisualize.jl). [Makie](https://github.com/JuliaPlots/Makie.jl) is worth investigating.

[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: http://juliagraphics.github.io/Luxor.jl/latest/

[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-stable-url]: http://juliagraphics.github.io/Luxor.jl/stable/

[pkgeval-link]: http://pkg.julialang.org/?pkg=Luxor

[pkg-0.5-img]: http://pkg.julialang.org/badges/Luxor_0.5.svg
[pkg-0.5-url]: http://pkg.julialang.org/detail/Luxor.html

[pkg-0.6-img]: http://pkg.julialang.org/badges/Luxor_0.6.svg
[pkg-0.6-url]: http://pkg.julialang.org/detail/Luxor.html

[pkg-0.7-img]: http://pkg.julialang.org/badges/Luxor_0.7.svg
[pkg-0.7-url]: http://pkg.julialang.org/?pkg=Luxor&ver=0.7

[travis-img]: https://travis-ci.org/JuliaGraphics/Luxor.jl.svg?branch=master
[travis-url]: https://travis-ci.org/JuliaGraphics/Luxor.jl

[appvey-img]: https://ci.appveyor.com/api/projects/status/jfa9e54lv92rqd3m?svg=true
[appvey-url]: https://ci.appveyor.com/project/cormullion/luxor-jl/branch/master

[codecov-img]: https://codecov.io/gh/JuliaGraphics/Luxor.jl/branch/master/graph/badge.svg
[codecov-url]: https://codecov.io/gh/JuliaGraphics/Luxor.jl
