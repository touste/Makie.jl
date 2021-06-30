using CairoMakie
# using CairoMakie
using GLMakie

CairoMakie.activate!(type = "svg")

let
    s = Scene(camera = campixel!)
    text!(s,
        ["hello", "what's up"],
        position = [(100, 100), (200, 200)],
        textsize = 20,
        space = :data,
        show_axis = false)
    s
end

##
with_theme() do
    f, ax , l = lines(cumsum(randn(1000)),
        axis = (
            title = L"\sum_k{x y_k}",
            xlabel = L"\lim_{x →\infty} A^j v_{(a + b)_k}^i \sqrt{23.5} x!= \sqrt{\frac{1+6}{4+a+g}}\int_{0}^{2π} \sin(x) dx",
            ylabel = L"x + y - sin(x) × tan(y) + \sqrt{2}",
        ),
        figure = (fontsize = 18, font = raw".\dev\MathTeXEngine\assets\fonts\NewCM10-Regular.otf")
    )
    text!(L"\int_{0}^{2π} \sin(x) dx", position = (500, 0))

    Legend(f[1, 2], [l, l, l], [L"\sum{xy}", L"a\int_0^5x^2+2ab", L"||x-y||^2"])
    display(f)
end
# save("test.pdf", f)
##
begin
    s = Scene(camera = campixel!)
    t = text!(s,
        L"\sqrt{2}",
        position = (50, 50),
        rotation = pi/2,
        show_axis = false,
        space = :data)
    display(s)
end
##
data = randn(100, 2)
f, ax, _ = scatter(data)
vlines!(ax, data[:, 1], ymax = 0.03, color = :black)
hlines!(ax, data[:, 2], xmax = 0.02, color = :black)
f

##
s = Scene(camera = campixel!)
t = text!(s,
    "hi what's up?",
    position = (50, 50),
    rotation = 0.0,
    show_axis = false,
    space = :data)
s

##

s = Scene(camera = campixel!)
t = text!(s,
    L"\int_0^5x^2+2ab",
    position = Point2f0(50, 50),
    rotation = 0.0,
    show_axis = false,
    space = :data)
wireframe!(s, boundingbox(t))
s

##

lines(0..25, x -> sin(x) / (cos(3x) + 4), figure = (fontsize = 20, font = "Times"),
    axis = (
        xticks = (0:50:100, [L"10^{-3.5}", L"10^{-4.5}", L"10^{-5.5}"]),
        yticks = ([-1, 0, 1], [L"\sum_%$i{xy}" for i in 1:3]),
        yticklabelrotation = pi/8,
        title = L"\int_0^1{x^2}",
        xlabel = L"\sum_k{x_k ⋅ y_k}",
        ylabel = L"\int_a^b{\sqrt{abx}}"
    )
)
text!(L"f(x) = \frac{sin(x)}{cos(3x) + 4}", position = (15, 2))
current_figure()

##

text(Tuple{AbstractString, Point2f0}[(L"xy", Point2f0(0, 0)), (L"\int^2_3", Point2f0(20, 20))],
    axis = (limits = (-5, 25, -5, 25),), align = (:center, :center))


# Data

# easy to understand
# coherent formatting
# correctly dated
# sufficient information content to retrace steps
# not so detailed / time-intensive as to hinder the actual work
# write down implicit assumptions
