/**
 * Mandelbulber v2, a 3D fractal generator  _%}}i*<.        ____                _______
 * Copyright (C) 2019 Mandelbulber Team   _>]|=||i=i<,     / __ \___  ___ ___  / ___/ /
 *                                        \><||i|=>>%)    / /_/ / _ \/ -_) _ \/ /__/ /__
 * This file is part of Mandelbulber.     )<=i=]=|=i<>    \____/ .__/\__/_//_/\___/____/
 * The project is licensed under GPLv3,   -<>>=|><|||`        /_/
 * see also COPYING file in this folder.    ~+{i%+++
 *
 * MandelbulbAbsPower2Iteration

 * This file has been autogenerated by tools/populateUiInformation.php
 * from the function "MandelbulbAtan2Power2Iteration" in the file fractal_formulas.cpp
 * D O    N O T    E D I T    T H I S    F I L E !
 */

REAL4 MandelbulbAtan2Power2Iteration(REAL4 z, __constant sFractalCl *fractal, sExtendedAuxCl *aux)
{
	aux->DE = aux->DE * 2.0f * aux->r;

	if (fractal->buffalo.preabsx) z.x = fabs(z.x);
	if (fractal->buffalo.preabsy) z.y = fabs(z.y);
	if (fractal->buffalo.preabsz) z.z = fabs(z.z);
	// bitwise ??
	REAL4 zz = z * z;
	REAL lenXY = native_sqrt(zz.x + zz.y);
	REAL theta1 = atan2(lenXY, z.z);
	REAL theta2 = -atan2(lenXY, -z.z);
	REAL phi = atan2(z.y, z.x) * fractal->transformCommon.scale1;

	REAL rr = dot(z, z);
	REAL sinth = native_sin(2.0f * theta1);
	z.x = sinth * native_cos(2.0f * phi);
	z.y = sinth * native_sin(2.0f * phi);
	z.z = -native_cos(theta1 + theta2);
	z *= rr;

	z.x = fractal->buffalo.absx ? fabs(z.x) : z.x;
	z.y = fractal->buffalo.absy ? fabs(z.y) : z.y;
	z.z = fractal->buffalo.absz ? fabs(z.z) : z.z;

	z += fractal->transformCommon.additionConstantA000;
	return z;
}