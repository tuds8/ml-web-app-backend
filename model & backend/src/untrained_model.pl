cad(n). cad(y). type(f). type(m). level(l). level(m). level(h). level(n).
t(0.5,A,B)::age(A,B):- level(B).
t(0.5,A,B)::sex(A,B):- type(B).
t(0.5,A,B)::cp(A,B):- level(B).
t(0.5,A,B)::trestbps(A,B):- level(B).
t(0.5,A,B)::chol(A,B):- level(B).
t(0.5,A,B)::thalach(A,B):- level(B).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- \+age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), \+sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), \+cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), \+trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), \+chol(A,F), thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), \+thalach(A,G), cad(A).
target(A,B, C, D, E, F, G):- age(A,B), sex(A,C), cp(A,D), trestbps(A,E), chol(A,F), thalach(A,G), cad(A).
