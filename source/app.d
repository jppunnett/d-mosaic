import std.stdio;
import std.format;
import dlib.image;

void main()
{
	auto img = loadImage("test.png");
	saveImage(img, "help.png");
	auto rotated = rotateImage(img, 90);
	saveImage(rotated, "rotated.png");
	writeln("Image size = ", img.width, "x", img.height);

	const square = 100;
	const RED = 0xFF0000;

	for(auto x = 0; x < img.width; x += square)
	{
		for(auto y = 0; y < img.height; y += square)
		{
			auto region = extractRegion(img, x, y, square, square);
			writeln(format("(%s, %s)", x, y));
			drawText(region, format("(%d, %d)", x, y), 10, 10, color3(RED));
			saveImage(region, format("region_%d_%d.png", x, y));
		}
	}
}

SuperImage extractRegion(SuperImage img, uint x, uint y, uint w, uint h)
{
	auto region = img.createSameFormat(w, h);
	foreach(ry; 0..region.height)
	foreach(rx; 0..region.width)
	{
		region[rx, ry] = Color4f(img[x + rx, y + ry]);
	}
	return region;
}