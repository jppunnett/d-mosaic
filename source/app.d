import std.stdio;
import dlib.image;

void main()
{
	auto img = loadImage("test.png");
	drawText(img, "Help!", 0, 0, color3(0xFFFFFF));
	saveImage(img, "help.png");
	auto rotated = rotateImage(img, 90);
	saveImage(rotated, "rotated.png");
}
