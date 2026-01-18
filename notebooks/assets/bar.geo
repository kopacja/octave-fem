// Parametry
L = 1.0;
A = 0.1;
b = Sqrt(A);

// Body (počátek vlevo nahoře)
Point(1) = {0,   0,  0};
Point(2) = {b,   0,  0};
Point(3) = {b,  -L,  0};
Point(4) = {0,  -L,  0};

// Hrany
Line(1) = {1, 2}; // horní
Line(2) = {2, 3}; // pravá
Line(3) = {3, 4}; // dolní
Line(4) = {4, 1}; // levá

// Uzavřená křivka a plocha
Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};

// Strukturované síťování
Transfinite Line {2, 4} = 4; // 3 prvky ve směru y → 4 uzly
Transfinite Line {1, 3} = 2; // 1 prvek ve směru x

Transfinite Surface {1};
Recombine Surface {1};
