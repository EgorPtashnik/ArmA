if (selectRandom [TRUE,FALSE]) then
{
	searchheli say3D ["ax_propaganda", 3000, 1, 0, 0, false];
}
else
{
	searchheli say3D ["ax_propaganda2", 3000, 1, 0, 0, false];
};

unknown sideChat "Attention Altis saboteurs. Lay down your weapons. 
We will give immunity to you if you testify against the government. 
Lay down your weapons right now, and we won't kill you. I'll say this one last time. 
AAF saboteurs. Put your hands up, and we won't kill you. We'll even give immunity if you just help us. 
If you support democracy, then listen to us!";

[]spawn
{
	sleep 17;
	var_loudspeaker = 1;
};