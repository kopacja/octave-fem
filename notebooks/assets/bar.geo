// Gmsh geometry file for 2D rectangular bar
// L = 1 m (length in -y direction)
// A = 0.1 m^2 (cross-section area)
// b = sqrt(A) = sqrt(0.1) m (width in +x direction)

// Parameters
L = 1.0;           // Length [m]
A = 0.1;           // Cross-section area [m^2]
b = Sqrt(A);       // Width [m]

// Number of elements
n_elem_y = 3;      // 3 elements in y-direction
n_elem_x = 1;      // 1 element in x-direction

// Origin at top-left corner
// x goes right (+x), y goes down (-y from origin perspective)

// Points (CCW ordering when viewed from +z)
// Start at origin (top-left), go CCW
Point(1) = {0, 0, 0};           // Top-left (origin)
Point(2) = {0, -L, 0};          // Bottom-left
Point(3) = {b, -L, 0};          // Bottom-right
Point(4) = {b, 0, 0};           // Top-right

// Lines (CCW direction for +z normal)
Line(1) = {1, 2};   // Left edge (top to bottom)
Line(2) = {2, 3};   // Bottom edge (left to right)
Line(3) = {3, 4};   // Right edge (bottom to top)
Line(4) = {4, 1};   // Top edge (right to left)

// Curve Loop (CCW for +z normal by right-hand rule)
Curve Loop(1) = {1, 2, 3, 4};

// Plane Surface
Plane Surface(1) = {1};

// Meshing parameters
// Transfinite lines for structured quad mesh
Transfinite Curve{1, 3} = n_elem_y + 1;  // Vertical edges: 4 nodes for 3 elements
Transfinite Curve{2, 4} = n_elem_x + 1;  // Horizontal edges: 2 nodes for 1 element

// Transfinite surface with corners specified CCW
Transfinite Surface{1} = {1, 2, 3, 4};

// Recombine triangles into quads
Recombine Surface{1};

// Physical groups for boundary conditions
Physical Curve("top") = {4};
Physical Curve("bottom") = {2};
Physical Curve("left") = {1};
Physical Curve("right") = {3};
Physical Surface("bar") = {1};

// Mesh settings
Mesh.ElementOrder = 1;           // Linear elements
Mesh.Algorithm = 8;              // Frontal-Delaunay for quads
