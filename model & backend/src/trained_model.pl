cad(n).
cad(y).
type(f).
type(m).
level(l).
level(m).
level(h).
level(n).
0.507042253521127::age(y,m) :- level(m).
0.492957746478873::age(n,m) :- level(m).
0.567164179104478::age(y,h) :- level(h).
0.432835820895522::age(n,h) :- level(h).
0.245614035087719::age(y,l) :- level(l).
0.754385964912281::age(n,l) :- level(l).
0.445652173913043::sex(n,m) :- type(m).
0.554347826086957::sex(y,m) :- type(m).
0.268292682926829::sex(y,f) :- type(f).
0.731707317073171::sex(n,f) :- type(f).
0.267716535433071::cp(n,h) :- level(h).
0.732283464566929::cp(y,h) :- level(h).
0.8::cp(n,m) :- level(m).
0.2::cp(y,m) :- level(m).
0.226666666666667::cp(y,l) :- level(l).
0.773333333333333::cp(n,l) :- level(l).
0.263157894736842::cp(y,n) :- level(n).
0.736842105263158::cp(n,n) :- level(n).
0.454545454545455::trestbps(y,m) :- level(m).
0.545454545454545::trestbps(n,m) :- level(m).
0.426229508196721::trestbps(n,h) :- level(h).
0.573770491803279::trestbps(y,h) :- level(h).
0.404761904761905::trestbps(y,l) :- level(l).
0.595238095238095::trestbps(n,l) :- level(l).
0.467432950191571::chol(y,m) :- level(m).
0.532567049808429::chol(n,m) :- level(m).
0.5::chol(y,l) :- level(l).
0.5::chol(n,l) :- level(l).
0.0::chol(y,h) :- level(h).
1.0::chol(n,h) :- level(h).
0.668539325842697::thalach(n,h) :- level(h).
0.331460674157303::thalach(y,h) :- level(h).
0.716049382716049::thalach(y,m) :- level(m).
0.283950617283951::thalach(n,m) :- level(m).
1.0::thalach(y,l) :- level(l).
0.0::thalach(n,l) :- level(l).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B,C,D,E,F,G) :- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
