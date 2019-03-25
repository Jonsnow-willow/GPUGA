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
#include "box.cuh"
#include <stdio.h>


class Fitness
{
public:
    Fitness(char*);
    ~Fitness(void);
    void compute(int, int, double*, double*);
protected:
    // functions
    void read_Nc(FILE*);
    void read_Na(FILE*);
    void read_xyz(FILE*);
    void read_box(char*);
    void allocate_memory_gpu(void);
    void find_neighbor(void);
    void get_fitness_population(int, int, double*, double*);
    double get_fitness_force(void);
    void find_force(void);

    // variables
    double *ters;
    double* potential_parameters;
    double* potential_parameters_min;
    double* potential_parameters_max;
    int Nc;      // number of configurations
    int *Na;     // number of atoms in each configuration
    int *Na_sum; // prefix sum of Na
    int N;       // total number of atoms (sum of Na)
    int num_types;
    int num_boxes;
    double cutoff = 1.1;
    int *NN, *NL, *type;
    double *x, *y, *z;
    double *fx, *fy, *fz, *pe, *sxx, *syy, *szz;
    double *fx_ref, *fy_ref, *fz_ref; 
    double *b, *bp, *f12x, *f12y, *f12z;
    double *force_error_gpu, *force_error_cpu;
    double force_ref_square_sum;

    // other classes
    Box box;
};

