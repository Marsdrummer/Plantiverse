# Plantiverse

https://github.com/Marsdrummer/Plantiverse/wiki

# How to make it
First, the hardware! You'll need a plant, an arduino and four sensors. We used:

1. water level sensor such as https://www.amazon.com/Sensor-Module-Detection-Surface-Arduino%EF%BC%8810pcs%EF%BC%89/dp/B07THDH7Y4/
2. SEN0193 capacitive soil moisture sensor such as https://www.amazon.com/Capacitive-Moisture-Corrosion-Resistant-Detection/dp/B07SYBSHGX
3. DHT11 humidity and temperature sensor such as https://www.adafruit.com/product/386
4. CdS photoresistor such as https://www.adafruit.com/product/161

The code provided is in two sections: an Arduino sketch for any board that you can connect to a computer, and a Processing sketch written for Windows (but easily adaptable for Mac OS or Linux).

# What we did
As laid out in our project description, our overall goal is to highlight the emerging spectrum of rights once granted only to privileged humans - now, increasingly available to all, regardless of gender, ethnicity, or other aspects of identity; and ultimately to the natural world. An indelible aspect of these rights is the right to have agency, autonomy, and ownership. By connecting a living plant to a system for creating art, we wanted to give this non-human being its own monetary assets that can go to protecting its vegetable brethren.

From a technical perspective, we needed a system that would translate data from and about the plant and its physiology, into code that could then be used to create a large number of different artworks, that it would compose to be minted and sold to raise money.

We used an Arduino Uno and four analog sensors. There are dozens if not hundreds of amazing sensors to choose from, but we prioritized aspects of the plant environment that change relatively rapidly such as soil moisture and light, to make sure it could capture the short attention span of us easily-distracted humans. In future work, we will look at plant biochemistry, growth rate, and other more difficult to measure factors.

We attached each of the four sensors to analog inputs on the Arduino, and wrote code that translated those inputs into a stream of data readable on a Windows-based computer's serial port. We modified a standard Arduino script to accommodate the range of analog inputs from the plant, mapping each onto a 0 to 255 scale.

Separately, we created a Processing sketch that maps those values received from the Arduino via the PC, onto four components of a digital picture of a plant: vases, leaves, flowers and backgrounds. For each of these components, several images were created and numbered sequentially. The Processing sketch takes the variables from the serial port and chooses the appropriate component. It then integrates all of the choices into one image, that it saves as a Scalable Vector Graphics (.svg) file to the user's local drive. We took the first image created by the plant-bot system and loaded it onto an NFT art site, where it was sold at auction.

# Why we did it
While this project used tiny house plants and a strong helping of humor, we see great potential in using a larger scale system based on the same principles to protect farmlands, forests, fields, and all manner of natural resources by giving them agency, authority, and assets.

Blockchain and cryptocurrency uniquely enable this way of connecting the natural world and its economic value, with the potential to reduce or eliminate the extractive exploitation by humans who can avoid paying Mother Nature for what they take today.

We envision forests writing symphonies, meadows making portraits, and mushrooms pumping out psychedelic imagery, all of which will remind us that they too are sentient. We're excited by this merger of human and non-human language, technology, and creativity - the seeds of which we're only now planting together.

# About the code - now and for the future
The code required for this project was incredibly simple, reflecting the simplicity of nature's code, DNA. Future modification ideas include mapping continuous variables coming off the analog sensors onto continuous variables in the produced image: for example, turning soil pH readings into the color of the vase, or the light level into the height of the stem of the plant. We hope creative plant technologists will take these ideas, and like natural evolution, help them mutate, reproduce, and grow.

# Did it work? YES!
Here's what came out of this project:
1. Obviously, the system functions as expected: this little minty houseplant can mint NFT are way faster and better then nearly any human.
2. Our next measure of the effectiveness of this application will be how quickly and for how much the images the plant creates can be sold for in order to raise money for plant preservation. So far, it's looking pretty good!
3. We also hope that the audacity and humor of the plant artist will spread awareness of how blockchain and cryptocurrency can help sustain the natural world, and even let us see non-human living things as equal participants in a global eco-economy. To this end, we want to continue to mint plant based NFTart, but also expand to more conventional measures of impact. We're hoping to see things such as:
- retweets and reposts of the plant's art
- requests to meet the plant influencers or commission custom works
- forks of our project and its code and imagery
- other processes of plant-human cocreation

Thanks for reading! 
/Herbie, Minty, Jessica, Cecilia, Mark, and Alex
