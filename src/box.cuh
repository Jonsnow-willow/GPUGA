/*
    Copyright 2019 Zheyong Fan
    This file is part of GPUGA.
    GPUGA is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    GPUGA is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with GPUGA.  If not, see <http://www.gnu.org/licenses/>.
*/


#pragma once


class Box
{
public:
    void read_file(char*);
    ~Box(void);
    int num_boxes;
    int pbc_x = 1;       // pbc_x = 1 means periodic in the x-direction
    int pbc_y = 1;       // pbc_y = 1 means periodic in the y-direction
    int pbc_z = 1;       // pbc_z = 1 means periodic in the z-direction
    int triclinic = 0;   // triclinic = 1 means the box is non-orthogonal
    int memory = 0;      // memory for box matrix
    double* h;             // GPU box data
    double* cpu_h;         // CPU box data
    double get_volume(void); // get the volume of the box
    void get_inverse(void);  // get the inverse box matrix
};


