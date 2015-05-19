
reset

# epslatex

set terminal epslatex size 20cm,8cm color colortext
set output 'wykres.tex'

# Line styles
set grid
set border linewidth 2

# Axes label
set xlabel 'Stężenie $\rho\;\; [\%]$'
set ylabel 'Liczba zliczeń w piku głównym'

set style line 1 linecolor rgb '#dd181f' linetype 1 linewidth 5 pt 2  # red
set style line 2 linecolor rgb '#7BE015' linetype 1 linewidth 5 pt 2 # green


#set key box opaque
# Axis ranges
# Tics in LaTeX format
set format '$%g$'
#autojustify
f(x) = a*x + b

set xrange[0:12]
#set yrange[0:20]


fit f(x) 'dane.dat' u 1:2 via a,b

title_f(a,b) = sprintf('$l_z = %.2f\rho + %.2f$', a, b)

set key inside right bottom;
set key box 3;

plot "dane.dat" u 1:2 w points pt 7 ps 1.5 lc 1 notitle, f(x) title title_f(a,b) ls 2#, "log_abs2.dat" u 1:2 title 'miedź' w p pt 7 lc rgb 'red',\
f(x) lc rgb 'green' lw 3 notitle,g(x) lc rgb 'red' lw 3 notitle


