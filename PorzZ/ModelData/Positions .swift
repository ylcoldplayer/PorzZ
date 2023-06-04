//
//  Positions .swift
//  PorzZ
//
//  Created by Yuanlong Chen on 5/21/23.
//

import Foundation
import UIKit


class Position {
    var name: String?
    var image: UIImage?
    var technique: String?
    var aka: String?
    var benefits: String?
    var tip: String?
    var alsoTry: String?
    var tried: Bool!
    var datesTried: [Date]?
    var count: Int!
    
    
    init(withName name: String,
         withImage image: UIImage,
         withTechnique technique: String,
         withAka aka: String,
         withBenefits benefits: String,
         withTip tip: String,
         withAlsoTry alsoTry: String
    ) {
        self.name = name
        self.image = image
        self.technique = technique
        self.aka = aka
        self.benefits = benefits
        self.tip = tip
        self.alsoTry = alsoTry
        self.tried = false
        self.datesTried = []
        self.count = 0
    }
}



struct Positions {
    static let shared = Positions()
    
    var allPositions: [Position]!
    
    private init() {
        allPositions = getAllPositions()
    }
    
    private func getAllPositions() -> [Position] {
        var positions: [Position] = []
        
        // TODO: handle exceptions later
        for positionRaw in positionsRaw {
            let name = positionRaw["name"]!
            let image =  UIImage(named: positionRaw["imageName"]!)!
            let aka = positionRaw["aka"]!
            let benefits = positionRaw["benefits"]!
            let technique = positionRaw["technique"]!
            let tip = positionRaw["tip"]!
            let alsoTry = positionRaw["alsoTry"]!
            
            positions.append(Position(
                withName: name,
                withImage: image,
                withTechnique: technique,
                withAka: aka,
                withBenefits: benefits,
                withTip: tip,
                withAlsoTry: alsoTry
            ))
        }
        
        return positions
    }
}


extension Position {
    func containsSearchText(withTextString textString: String) -> Bool {
        let allStrings = [self.aka ?? "", self.alsoTry ?? "", self.benefits ?? "", self.name ?? "", self.technique ?? "", self.tip ?? "" ].lazy.joined(separator: " ")
        if !allStrings.isEmpty {
            return allStrings.lowercased().contains(textString.lowercased())
        }
        return false
    }
}











private let positionsRaw = [
    ["name": "Stand and Deliver",
     "imageName": "men-shealth-stand-deliver-1581102532",
     "aka": "The Bicycle",
     "benefits": "The giver (a.k.a. the partner who’s doing the penetrating) can enjoy the view of their penis or dildo thrusting.",
     "technique": "The giver stands at the edge of a bed or desk while the receiver (a.k.a. the partner who’s being penetrated) lies back and raises their legs to their chest. The receiving partner’s knees are bent as if they're doing a bicycling exercise. The giver grabs their partner’s ankles and enters them. The giver should thrust slowly, as the deep penetration may be painful for the receiver.",
     "tip": "If you’re the giver, encourage your partner to play with their clitoris or penis in this position. Also, show them that they can control your penetration by flexing their thighs.",
     "alsoTry": "The receiving partner can place their heels on the giver’s shoulders, which will help open their hips."
    ],
    ["name": "Face Off",
     "imageName": "menshealth-faceoff-v3-1581102194",
     "aka": "The Lap Dance",
     "benefits": "Allows for face-to-face intimacy; cozy for long sessions.",
     "technique": "The giver sits on a chair or at the edge of a bed. The receiving partner faces the giver, wraps their arms around the giver’s back, and sits in their lap. Once in the saddle, the receiver can ride up and down on the giver’s shaft by pressing with their legs or knees. Want to go faster? The penetrating partner can grab the receiving partner’s buttocks to assist with lifting and bouncing.",
     "tip": "The receiver can sit facing the giver on a rocking chair. Old wooden rockers on hardwood or stone floors provide extra movement.",
     "alsoTry": "There's lots of room for creativity in this position for stimulating erogenous areas of the upper body, head, neck, and face. If the receiver likes having their nipples licked, go for it!"
    ],
    ["name": "Pearly Gates",
     "imageName": "pearly-gates-2-1650381834",
     "aka": "",
     "benefits": "Great for G-spot stimulation",
     "technique": "The giver lies on their back. The receiver can straddle them in a reverse cowgirl position before carefully leaning backward until their back is on their partner's chest.",
     "tip": "The giver can reach around and play with the receiver's nipples or clitoris. (The receiver can also use a vibrator in this position.)",
     "alsoTry": ""
    ],
    ["name": "The Socket",
     "imageName": "men-shealth-thesocket-1581101518",
     "aka": "",
     "benefits": "This looks like it's a nice position to fantasize a little and get a new view of your partner’s behind,” says Kerner. “It's a chance to get absorbed in the sensations.",
     "technique": "From reverse cowgirl, the receiving partner bends all the way forward, extending their legs all the way back. They should be supporting their body by resting on their elbows, as if they’re holding a plank.",
     "tip": "In this position, a vulva-owning receiver can easily touch their clitoris while being penetrated. And if the two of you are into spanking, have at it.",
     "alsoTry": ""
    ],
    ["name": "Happy Baby",
     "imageName": "mh-happybaby-1650382591",
     "aka": "",
     "benefits": "This position works for both vaginal and anal penetration—and it’s perfect for G-spot stimulation. It’s also a more comfortable option for receivers with lower back pain.",
     "technique": "The receiving partner assumes the “happy baby” pose, a yoga position where you lie on your back, bend your knees into your chest, grip the outer edges of your feet, and roll side to side like, well, a happy baby. In this case, instead of rolling around, the receiver stays put so the penetrating partner can enter them from a kneeling position.",
     "tip": "If the receiver doesn’t have much flexibility or balance, the giver can help hold their legs up and apart.",
     "alsoTry": "Tweaking your angles by sliding a sex pillow underneath the receiving partner's hips."
    ],
    ["name": "Standing O",
     "imageName": "menshealth-standingo-1581101725",
     "aka": "",
     "benefits": "Ideal position for all things cunnilingus and any forms of vulva or vaginal stimulation you want to throw in: clit sucking, rubbing, digital penetration, and G-spot stroking.",
     "technique": "The giving partner should be on their knees, with the receiving partner standing upright. The receiver should drape one of their legs around the giver’s shoulders—then, let the eating out begin!",
     "tip": "Ideally, the receiving partner should have their hands above their head. This can be accomplished by using some BDSM restraints. If restraints aren’t their thing, see if you can find an anchored bar or beam for them to grasp.",
     "alsoTry": ""
    ],
    ["name": "The Little Dipper",
     "imageName": "menshealth-littledipper-v2-1581101785",
     "aka": "",
     "benefits": "A great position that allows for clitoral stimulation with both your mouth and fingers",
     "technique": "The receiving partner will have sore triceps once you both finish. For the Little Dipper, the receiving partner uses either a bed, couch, or chair to hoist themselves over their partner. The penetrating partner then inserts their penis or dildo into their partner’s vagina or anus. The receiver then does tricep dips to move up and down on their partner’s shaft. If done correctly, you should be in a T-shape formation.",
     "tip": "The penetrating partner can play with the receiver’s clitoris or penis for extra stimulation.",
     "alsoTry": ""
    ],
    ["name": "The 69 Bridge",
     "imageName": "men-shealth-69-bridge-v2-1582129462",
     "aka": "Golden Gate",
     "benefits": "",
     "technique": "This just looks impossible to me, but if you’re able to do it, go for it. I think it’s just a victory in being able to pull this position off.",
     "tip": "If you’re the person lying on your back, you may need to help out your partner by thrusting your pelvis up, so their mouth can actually reach your genitals.",
     "alsoTry": ""
    ],
    ["name": "Coital Alignment Technique",
     "imageName": "men-shealth-thecat-1581101913",
     "aka": "The CAT",
     "benefits": "This position offers strong clitoral stimulation for partners with vulvas. A study published in the Journal of Sex and Marital Therapy found that the CAT significantly increases the likelihood that a vulva-owning partner will orgasm during sex.",
     "technique": "The CAT is very similar to the missionary position, except the penetrating partner is positioned farther up and to one side. Instead of being chest to chest, the giver’s chest is near the receiver’s shoulders. The receiving partner should bend their legs about 45 degrees to tilt their hips up. This causes the base of the giver’s shaft to maintain constant contact with the receiving partner’s clitoris",
     "tip": "Instead of thrusting up and down, the giver can try rocking forward and back or grinding their pelvis in a circular motion, depending on what feels best for their partner.",
     "alsoTry": "The giver can push their pelvis down a few inches while the receiver pushes up for extra pressure."
    ],
    ["name": "The Captain",
     "imageName": "mh-captain-1650390659",
     "aka": "V is for Victory",
     "benefits": "Deep penetration, G-spot or prostate stimulation, and access to the clitoris.",
     "technique": "The receiving partner lies on their back and raises their legs in the air. Kneeling, the penetrating partner holds the receiver’s ankles and spreads their legs into a V shape before entering them.",
     "tip": "Since the penetrating partner's hands are busy holding the receiver's legs in place, the receiver can hold a vibrator if they want to add some clit stimulation to this position. Don’t forget to make sure the receiving partner stretches their hamstrings first.",
     "alsoTry": ""
    ],
    ["name": "Waterfall",
     "imageName": "men-shealth-thewaterfall-1581101948",
     "aka": "Head Rush",
     "benefits": "The blood will rush to the giver’s other head, too.",
     "technique": "The giver moves to the edge of the bed and lies back with their head and shoulders on the floor as their partner straddles them. The blood will rush to the penetrating partner’s head, creating mind-blowing sensations upon orgasm.",
     "tip": "Make sure the giver has a pillow under their head for a safer, more comfortable experience.",
     "alsoTry": ""
    ],
    ["name": "One Up",
     "imageName": "men-shealth-oneup-v2-1581101983",
     "aka": "Over Your Shoulder, The Hamstring Stretch",
     "benefits": "This is a great sex position for vulva-owners who are particularly sensitive along one side of the clitoris.",
     "technique": "The giver kneels on the floor with their mate lying on the edge of the bed. The giver then raises one of their partner’s legs and asks their partner to support it by wrapping their hands around their thigh. With one hip raised, the receiving partner will be able to add some movement to aid in the giver’s stroking or to help move the giver to the perfect spot.",
     "tip": "During cunnilingus, the giver can allow the knuckle of their finger to trail behind their tongue. The contrast between soft flesh of the tongue and hard bone of the finger will create a pleasing sensation. (For more oral pleasure positions, check out Your Ultimate Guide to Oral Sex.) The receiver can also show their partner the tongue pressure and technique they prefer by demonstrating with their mouth on their partner’s earlobe.",
     "alsoTry": "The receiver can wriggle a little to help their partner get the right rhythm."
    ],
    ["name": "The Cowgirl",
     "imageName": "men-shealth-thecowgirl-1581102015",
     "aka": "",
     "benefits": "There's going to be G-spot stimulation, clitoral stimulation, and cervical stimulation. It’s a nice position for the person on top to really control their orgasm. It also gives you a great view of everything that’s happening.",
     "technique": "Cowgirl is one of the best sex positions because it allows for a variety of interesting sights and sensations, especially for vulva-owning receivers. It allows the receiver to take charge of the pace and depth of penetration. Alternate between shallow and deep thrusts. Shallow will stimulate the front third of the vagina, which is the most sensitive",
     "tip": "It will be easier for the receiver to climax in this position if the giver stimulates them manually and orally until they're extremely aroused.",
     "alsoTry": "Lie chest to chest. The receiving partner should brace their feet on the tops of the penetrating partner’s feet and push off to create a rocking motion that will rub the vulva and clitoral area against the penetrating partner’s pubic bone."
    ],
    ["name": "The Hot Seat",
     "imageName": "men-shealth-hotseat-1581102043",
     "aka": "The Love Seat",
     "benefits": "Good G-spot stimulation.",
     "technique": "The penetrating partner sits on the edge of the bed or on a chair with their feet on the floor. The receiving partner turns away and backs up, sitting between their partner’s legs. They can ride the giver’s shaft by pushing off the chair arms or pressing up with their feet. While doggy style is about the giver’s dominance, The Hot Seat puts the receiving partner in the driver's seat. And that makes it one of the best sex positions for both of you.",
     "tip": "The receiver can control the angle of entry by arching their back and pressing their buttocks into the giver’s groin.",
     "alsoTry": "The receiving partner can reach under and stimulate the base of the penetrating partner’s penis, scrotum, and perineum. Meanwhile, the penetrating partner can reach around and stimulate the receiver’s nipples."
    ],
    ["name": "Spin Cycle",
     "imageName": "menshealth-spincycle-1581102077",
     "aka": "Maytag Repair Man",
     "benefits": "Extra vibes.",
     "technique": "This is a variation on the Hot Seat with the receiving partner sitting in the penetrating partner’s lap, but this time, you plant yourselves on top of a washing machine set at the highest agitator cycle.",
     "tip": "The partner sitting on the washing machine can spread their buttocks and enjoy the vibration against their perineum.",
     "alsoTry": ""
    ],
    ["name": "Stairway to Heaven",
     "imageName": "menshealth-stairwaytoheaven-1581102102",
     "aka": "Step Lively",
     "benefits": "Good hand holds for the receiving partner, and you don't have to wait until you reach the bedroom.",
     "technique": "This is a variation on The Hot Seat with the receiver sitting on top of their partner while the giver sits on one of the stairs of a staircase. Stairs offer good seating possibilities, and a hand rail for extra support and leverage.",
     "tip": "",
     "alsoTry": "For a safer experience, try this at the bottom of the steps rather than at the top."
    ],
    ["name": "Reverse Cowgirl",
     "imageName": "menshealth-reversecowgirl-v2-1581102136",
     "aka": "Rodeo Drive, Halfway Around the World",
     "benefits": "With a pillow under their head, the penetrating partner gets an awesome view of their mate's backside. The receiving partner can also control depth of penetration and pace with this sex position.",
     "technique": "The giver lies on their back with their legs outstretched. The receiving partner kneels next to the giver and then turns and spreads their legs, straddling the giver’s hips and facing their feet. Kneeling, the receiver lowers down onto the giver’s shaft and begins riding.",
     "tip": "From this position, the receiver partner can easily reach down to touch themselves or direct the penis or dildo where it feels best.",
     "alsoTry": "The receiving partner can lean forward or back to change the angle of penetration."
    ],
    ["name": "Pole Position",
     "imageName": "menshealth-poleposition-1581102164",
     "aka": "Thighmaster",
     "benefits": "Dual stimulation for the receiving; for the giver—a great view of the receiver’s rear and your penis or dildo entering them.",
     "technique": "The giver lies on their back and bends one of their legs, keeping the other outstretched. The receiving partner straddles the raised leg with a thigh on either side and lowers themselves onto the giver’s member so that their back is facing the giver. They should hold the giver’s knee and use it for support as they rock up and down.",
     "tip": "From Pole Position, the receiver can massage the giver’s raised leg during the action or reach down and touch the giver’s perineum.",
     "alsoTry": "A vulva-owning receiver can press their vulva hard against the giver’s upper thigh, rubbing as the feeling dictates."
    ],
    ["name": "The Lazy Man",
     "imageName": "menshealth-lazyman-1581102217",
     "aka": "The Squat Thrust",
     "benefits": "Puts the receiver in control, maintains intimacy.",
     "technique": "The giver places pillows behind their back and sits on the bed with legs outstretched. The receiving partner straddles the giver’s waist with their feet on the bed. They then bend their knees to lower themselves onto the giver, using one hand to direct the shaft in. Just by pressing on the balls of their feet and releasing, they can raise and lower themselves on the giver’s penis or dildo as slowly or quickly as they please.",
     "tip": "The giver can easily lick the receiver’s nipples in this position.",
     "alsoTry": "From this position, you both lie back into the Spider position or its more challenging variation, The X."
    ],
    ["name": "David Copperfield",
     "imageName": "menshealth-davidscopperfield-1581102244",
     "aka": "Trick & Treat",
     "benefits": "This sex position is the piece de resistance for partners who prefer a strong, upward stroking motion during cunnilingus.",
     "technique": "Place a pillow under the receiver’s hips to tilt their pelvis up. The receiver should bend their knees so they can place their feet on the giver’s shoulder blades.",
     "tip": "The giver can let their tongue rest firmly and flat against the full length of the vaginal entrance and have the receiver grind against their tongue.",
     "alsoTry": "The giver can amplify their oral efforts with a simple sleight-of-hand trick: While lapping away, try using your hands to push gently upward on the receiver’s abdomen, stretching their skin away from their pubic bone, to help coax the head of the clitoris out from beneath the hood."
    ],
    ["name": "Heir to the Throne",
     "imageName": "menshealth-heirtothethrone-1581102275",
     "aka": "Lazy Girl",
     "benefits": "The ultimate sex position for oral on the go.",
     "technique": "The receiver sits on a chair with their legs wide open. This is a good sex position for either beginning the slow build-up with loose, broad, strokes, or ending with strong suction. In this position, the receiver can easily guide the giver, and the giver gets a full view between the receiver’s legs, which is a turn-on for many people.",
     "tip": "The giver can insert one or two fingers and stroke in a \"come hither\" motion to wake up their partner’s G-spot in this sex position. With either their tongue or other hand, the giver can also apply pressure to the receiver’s pubic bone. This dual stimulation executed just right will send the receiver over the edge.",
     "alsoTry": "Switch to a swivel chair—the giver can turn it left and right as they hold their tongue stationary."
    ],
    ["name": "Closed for Business",
     "imageName": "menshealth-closedbusiness-1581102307",
     "aka": "",
     "benefits": "A variation of One Up that allows for slow buildup.",
     "technique": "Some people with vulvas find direct clitoral stimulation uncomfortable. Having the receiver close their legs during oral sex may help. The giver places their hand above the receiver’s public mound, applying light pressure, and then rubs their tongue on the area around the clitoris to add indirect stimulation.",
     "tip": "The giver can also try keeping their tongue still while the receiver rocks their pelvis back and forth.",
     "alsoTry": ""
    ],
    ["name": "The Pretzel",
     "imageName": "men-shealth-pretzel-1581102338",
     "aka": "The Pretzel Dip, The Camel Ride",
     "benefits": "The deep penetration of doggy-style while face to face.",
     "technique": "The giver kneels and straddles the receiver’s left leg while they're lying on their left side. The receiver then bends their right leg around the right side of the giver’s waist, which will provide access to their vagina. For many people with vulvas, rear entry hurts their backs. This sex position allows them to lounge comfortably while enjoying deep penetration.",
     "tip": "The giver should be gentle with the clitoris. Some people even prefer gentle pressure around it rather than direct stimulation. Go soft, then increase speed and pressure.",
     "alsoTry": "The giver can manually stimulate the receiver using their fingers in this position. They can also withdraw their penis or dildo and, holding their shaft with their left hand, rub the head against their partner’s clitoris to bring them to the brink of orgasm."
    ],
    ["name": "Yourself on the Shelf",
     "imageName": "menshealth-yourselfonashelf-1581101522",
     "aka": "The Bicycle",
     "benefits": "You can enjoy the view of your penis thrusting inside of your partner, and this position really allows for direct clitoral stimulation,",
     "technique": "The receiving partner perches their butt right on the edge of the bed. The giver enters them while standing. Then the receiver can wrap their legs around the giver while the giver wraps their hands around the receiver’s back for extra support.",
     "tip": "It’s a great way to finish having sex. Since the position is strenuous, try doing it 30-60 seconds before you or your partner are about to orgasm.",
     "alsoTry": "If you’re the giver and you don’t have the quad and glute muscles to pull this position off, just keep your partner on the edge of the bed, penetrating them there."
    ],
    ["name": "The G-Whiz",
     "imageName": "menshealth-gwhiz-v2-1581102368",
     "aka": "The Shoulder Holder, The Anvil",
     "benefits": "Allows deep penetration and targeting the G-spot or P-spot.",
     "technique": "The receiving partner lies on their back. The giver kneels between the receiver’s legs and raises them, resting the receiver’s calves over the giver’s shoulders. The giver should rock the giver in a side-to-side and up-and-down motion to bring the head and shaft of their penis or dildo in direct contact with the front wall of the receiver’s vagina or anus. Because this angle allows for deep penetration, thrust slowly at first to avoid causing discomfort.",
     "tip": "If you’re the giver, notice your partner getting close to orgasm. You can do that by listening for their breath to become short and shallow. Flushed skin and slightly engorged breasts also indicate they're nearing the peak of arousal.",
     "alsoTry": "The receiver can place their feet on the giver’s chest This allows the receiver to control the tempo and depth of thrusts."
    ],
    ["name": "Doggy Style",
     "imageName": "menshealth-mansbestfriend-v2-1581102405",
     "aka": "Man's Best Friend",
     "benefits": "Deep penetration and an erotic view.",
     "technique": "This could be your next move after starting in The Flatiron sex position. By entering their partner from behind, the giver is able to thrust deep—and if they’re entering vaginally, the tip of their penis or dildo might touch their partner’s cervix, an often-neglected pleasure zone. But you should do this slowly and gently. Some people with vulvas find it painful.",
     "tip": "The receiver may be able to increase the intensity of their orgasm by pushing their pelvic floor muscles outward, as if trying to squeeze something out of their vagina. This causes the vaginal walls to lower, making the G-spot more accessible.",
     "alsoTry": ""
    ],
    ["name": "The Flatiron",
     "imageName": "men-shealth-flatiron-v2-1581102438",
     "aka": "Downward Dog, The Belly Flop",
     "benefits": "Intensifies vaginal pleasure.",
     "technique": "The receiver lies face down on the bed with their knees slightly bent and hips slightly raised. For comfort, and to increase the angle of their hips, they can place a pillow under their lower abs. The giver enters them from behind and keeps their weight off the receiver’s body with their arms. This position creates a snug fit, making the giver’s shaft feel larger to their partner.",
     "tip": "Givers, less friction means less stimulation—and that can help you last longer. Try using a very slippery silicon-based lubricant, which may allow you to thrust longer before reaching orgasm.",
     "alsoTry": "The giver will last longer in this position if they switch to shallower thrusts and practice deep breathing."
    ],
    ["name": "Butter Churner",
     "imageName": "menshealth-butterchurner-1581102466",
     "aka": "Squat Thruster",
     "benefits": "An extra rush of blood to the receiver's head to increase their ecstasy.",
     "technique": "The receiver lies on their back with their legs raised over their head. This is not a plain Jane position! The giver squat over them and dips their penis or dildo in and out of them. Penetrating partners, be extra careful to thrust lightly to avoid stressing their neck—Kerner warns this position could potentially result in a neck injury.",
     "tip": "Novelty ignites passion by increasing your brain's levels of dopamine, a neurotransmitter linked to romance and sex drive, says biological anthropologist Helen Fisher, Ph.D. The Butter Churner qualifies for novelty, but you don't need to go to such extremes to sustain romance. Anything that's new and different will do the trick.",
     "alsoTry": ""
    ],
    ["name": "The Ballet Dancer",
     "imageName": "menshealth-theballerina-1581102502",
     "aka": "",
     "benefits": "Erotic move for quickies in tight quarters. Good option for outdoor sex. Allows for easier penetration. The receiver has control of thrusting, depth, and angle.",
     "technique": "You stand facing one another. The receiving partner raises one of their legs, wraps it around the giver’s buttocks or thigh, and pulls the giver into them.",
     "tip": "Try this standing position in a hot shower. During the steamy foreplay, rub each other's bodies with a coarse salt scrub to stimulate nerve endings and blood flow.",
     "alsoTry": "If that wrapped leg gets tired, the giver can cradle it with their arm. If your mate's very flexible, lift their leg over your shoulder."
    ],
    ["name": "Iron Chef",
     "imageName": "menshealth-ironchef-v2-1581102562",
     "aka": "Kitchen Confidential",
     "benefits": "Good sex position for a quickie with deep penetration.",
     "technique": "A variation of The Ballet Dancer in which the receiver raises their legs up and wraps them around the giver’s butt or thighs. Your kitchen counter is the perfect height for this standing-to-seated appetizer.",
     "tip": "The giver can pull the receiver’s hips towards them to aid in thrusting (just don’t pull them off the counter).",
     "alsoTry": ""
    ],
    ["name": "H2Ohh Yeah",
     "imageName": "mens-health-h2ohhyeah-1581102708",
     "aka": "Aquaman's Delight",
     "benefits": "Good for an outdoor quickie, while still avoiding prying eyes.",
     "technique": "Another variation of The Ballet Dancer. The receiver’s buoyancy in the water makes this sex position easier to hold. And all you need to do is shift some bathing suit material out of the way of certain body parts; the lifeguards will be none the wiser.",
     "tip": "Water washes away the body’s natural lubrication, so this position might be best for external stimulation.",
     "alsoTry": ""
    ],
    ["name": "Wheelbarrow Standing",
     "imageName": "menshealth-standingwheelbarrow-v2-1581102781",
     "aka": "The Hoover Maneuver",
     "benefits": "Calorie burner because it's so athletic. You can stroll around the house in this position, but draw the shades first.",
     "technique": "The giver enters their partner as they would in a standing, rear entry position, but instead, the giver lifts the receiver up by the pelvis. The receiver then grips the giver’s waist with their legs. Summer camp wheelbarrow races were never this much fun!",
     "tip": "The receiver can rhythmically squeeze their PC muscles to help them climax.",
     "alsoTry": ""
    ],
    ["name": "Seated Wheelbarrow",
     "imageName": "men-shealth-seatedwheelbarrow-1581102856",
     "aka": "Wheelbarrow at Rest",
     "benefits": "Less strenuous than the standing varieties of this sex position, while still offering intense sensation.",
     "technique": "Try the wheelbarrow with the giver sitting on the edge of a bed or chair. Movement is limited, but penetration is deep.",
     "tip": "Make some noise. Explore the deeper sexual response and energy by letting loose with powerful sounds—a roar, perhaps?",
     "alsoTry": ""
    ],
    ["name": "The Standing Dragon",
     "imageName": "menshealth-standingdragon-v2-1581102893",
     "aka": "",
     "benefits": "An ideal position for G-spot stimulation—and if you’re the giver, seeing the curves of your partner's rear can be highly erotic.",
     "technique": "The penetrating partner stands and enters the receiver from behind as they pose on all fours on the edge of the bed and arch their back to lift their buttocks.",
     "tip": "With their legs outside of their partners, givers can use their thighs to squeeze their partner’s knees together, which tightens the receiver’s vagina around the giver’s penis or dildo.",
     "alsoTry": ""
    ],
    ["name": "Restroom Attendant",
     "imageName": "menshealth-bathroomattendant-v2-1581102921",
     "aka": "Don’t Get Caught",
     "benefits": "Good for a quickie at a party.",
     "technique": "After slipping into a bathroom, the receiver looks into the mirror while the giver enters them from behind. This position lets you both have eye contact during this rear-entry sex position.",
     "tip": "If the receiver likes to be dominated, pull their hair.",
     "alsoTry": ""
    ],
    ["name": "Couch Surfer",
     "imageName": "menshealth-couchsurfer-1581102970",
     "aka": "The Lazy Susan",
     "benefits": "Convenient for a quickie and adds spice outside the bedroom.",
     "technique": "The receiving partner bends their body over the arm of a couch as the giver enters them from behind. The receiver can grind on the firm but cushy arm for multiple forms of stimulation with minimal effort.",
     "tip": "Have the receiver cross their ankles. This will squeeze their pelvic floor and gluteal muscles tightly around the giver’s penis or dildo.",
     "alsoTry": ""
    ],
    ["name": "Quickie-Fix",
     "imageName": "menshealth-quickiefix-1581103047",
     "aka": "The Bends",
     "benefits": "Greater thrusting power, and good for quickie sex in your kitchen, especially if the receiving partner is wearing a skirt.",
     "technique": "The receiver bends at the waist and rests their hands on a piece of furniture, their knees, or the floor for support. The giver enters them from behind and holds their hips for support while thrusting.",
     "tip": "The giver can also massage the receiver’s shoulders or stimulate their breasts by bending over them.",
     "alsoTry": "The giver can reach below to caress the receiver’s clitoris or penis for extra stimulation."
    ],
    ["name": "Mountain Climber",
     "imageName": "menshealth-mountainclimber-1581103074",
     "aka": "The Pushup",
     "benefits": "Creates great eye-to-eye contact. Keeps the giver’s weight off the receiver’s bod.",
     "technique": "The mountain climber position shows off the giver’s strength. While between their partner's legs, the giver assumes the standard \"pushup\" sex position.",
     "tip": "The giver can also tease the receiver with a series of moves: by entering with just the tip; thrusting just halfway in; then out; and stroking the outside with their member. The receiver can reach down and grab the giver’s shaft and rub their clitoris with it.",
     "alsoTry": "The giver can lower themselves to kiss their partner teasingly while thrusting with their shoulders as well as their pelvis."
    ],
    ["name": "Quicker Picker Upper",
     "imageName": "menshealth-quickerpickerupper-1581103100",
     "aka": "The Pillow Driver",
     "benefits": "A little bit of variety if missionary begins to feel stale; good upper body exercise.",
     "technique": "Place a pillow under the small of the receiver’s back or their buttocks to tilt their pelvis and change the angle of penetration for different sensations. The penetrating partner then braces their body with their hands on the bed in a pushup position, taking their weight off the receiver’s body.",
     "tip": "For more stability, try using a firm positioning pillow that’s specifically designed for sex.",
     "alsoTry": ""
    ],
    ["name": "Missionary",
     "imageName": "men-shealth-missionary-v2-1581103126",
     "aka": "The Matrimonial",
     "benefits": "We know this one isn't necessarily new to lots of guys, but there's something sort of kinky about doin' it in the most vanilla position of all. Plus, you get lots of eye and body contact.",
     "technique": "The most commonly used position in the world, missionary is an especially intimate position because it allows for face-to-face contact. The penetrating partner likes it because they can control penetration depth and speed of thrusting. The receiving partner enjoys feeling the giver’s weight on their body and the maximum skin-to-skin contact. Note that this position can make it more difficult to hold off ejaculation because of the intense friction and deep thrusting. To lengthen lovemaking, start there, then switch to a position that maintains clitoral pressure without so much pelvic back and forth.",
     "tip": "If you’re the giver, raise the receiver’s left leg so their knee is level with your right shoulder. Keep their other leg flat on the bed. Thrust toward the inner thigh of their raised leg. This adjustment creates more clitoral pressure.",
     "alsoTry": "The giver can push up to create space and sneak a small vibrator on top of the receiver’s mound."
    ],
    ["name": "Spoon",
     "imageName": "men-shealth-spoon-v2-1581103250",
     "aka": "The Sleeper Hold",
     "benefits": "Comfortable sex position if a partner is pregnant or if one or both partners have bigger bellies. Good one for falling asleep afterward.",
     "technique": "You both lie on your sides facing the same direction, with the giver in back. The receiving partner bends their knees and pushes their rear back toward the giver for easier access to their vagina or anus. Adjusting the lean of your bodies will vary the angle of entry and help with rocking and thrusting.",
     "tip": "To give the receiver the sensation of greater girth inside them, have them bend and lift their top leg to their chest. Adjust your position so you are more on top of them top hip than behind them.",
     "alsoTry": "Synchronize your breathing. One of you takes the lead and the other follows so that you inhale and exhale together. The coordinated rhythm opens an unspoken dialogue of intimacy."
    ],
    ["name": "Open-Legged Spoon",
     "imageName": "open-legged-spoon-3-1650382204",
     "aka": "",
     "benefits": "It's everything you love about the classic spoon position, with the added opportunity for clit access.",
     "technique": "From the Spoon position, the receiving partner lifts their top leg and drapes it backward over the penetrating partner's hips",
     "tip": "The open-legged element of this position means the partner in back can reach around and play with their partner's penis or clitoris—either with their hands or a vibrator.",
     "alsoTry": ""
    ],
    ["name": "Spork",
     "imageName": "menshealth-spork-1581103273",
     "aka": "Spoon and Fork Combo, Scissoring",
     "benefits": "Offers a natural bridge to more creative positions.",
     "technique": "The receiver lies on their back and raises their right leg so the giver can position their body between their legs at a 90-degree angle and enter. The receiver’s legs will form the tines of a spork. They can do this with the giver facing them or facing their back.",
     "tip": "From the Spork position, the receiver can lift their top leg and let the giver support it by resting it on their shoulder. From here, the receiver can easily stimulate their clitoris using their fingers while the giver is inside them.",
     "alsoTry": "If the receiver is limber, lift their left leg up to increase the depth of penetration."
    ],
    ["name": "Gift Wrapped",
     "imageName": "menshealth-giftwrapped-1581103304",
     "aka": "The Horny Mantis",
     "benefits": "Relaxing position with deeper penetration and increased intimacy.",
     "technique": "Both of you lie on your sides facing one another. The receiving partner bends, spreads their legs, and angles their vagina or anus toward the giver. The giver lifts their legs, wraps them around the receiver’s back, and enters them.",
     "tip": "The receiver can use their legs and feet to pull the giver close during thrusts for deeper penetration.",
     "alsoTry": ""
    ],
    ["name": "Spoon Facing",
     "imageName": "menshealth-spoonfacing-1581103341",
     "aka": "Sidewinder",
     "benefits": "A very intimate face-to-face position that encourages hugging and kissing.",
     "technique": "This is an ideal position for pregnant partners and partners with knee injuries because it keeps weight off the body. To get into the position, begin by lying on your sides and facing one another. The receiving partner spreads their legs slightly to allow the penetrating partner to enter them, then closes their legs so the part of the giver’s shaft that's outside can press against their clitoris. It's easy to kiss from this intimate face-to-face position.",
     "tip": "Hug each other for 20 seconds before getting busy. Hugging raises your levels of oxytocin, a bonding hormone your body produces naturally, and that will enhance your connection.",
     "alsoTry": "Because thrusting is more difficult in this position, use different techniques such as grinding, circular, and up-and-down motions for added stimulation."
    ],
    ["name": "The X Position",
     "imageName": "menshealth-thexposition-1581103466",
     "aka": "Crisscross",
     "benefits": "Prolonged, slow sex to build arousal. Shallow thrusts stimulate the nerve endings in the head of the giver’s penis.",
     "technique": "Sit on the bed facing each other with legs forward. The giver should lift their right leg over the receiver’s left leg, and the receiver should lift their right leg over the giver’s left leg. Come together so the giver can enter. Now both of you lie back, with your legs forming an X. Slow, leisurely gyrations replace thrusting.",
     "tip": "Reach out and hold hands to pull together for pelvic thrusting. Also, take turns alternatively sitting up and lying back without changing the rhythm.",
     "alsoTry": ""
    ],
    ["name": "Snow Angel",
     "imageName": "menshealth-thesnowangel-1581103492",
     "aka": "Bottom's Up",
     "benefits": "The receiving partner gets a prime view of the giver’s derriere.",
     "technique": "This is challenging: The receiver lies on their back while the giver straddles them, facing away. The receiver lifts their legs and wraps them around the giver’s back to elevate their pelvis so the giver can enter. Then the receiver grabs the giver’s butt to help the giver slide up and back. They can add a little massage action to their grip also.",
     "tip": "The giver can spin around into missionary style to face the receiver while trying to stay inserted. Then switch positions, this time with the receiver on top and facing away.",
     "alsoTry": ""
    ],
    ["name": "The Fusion",
     "imageName": "menshealth-thefusion-1581103569",
     "aka": "Getting a Leg Up",
     "benefits": "Quicker orgasms for the receiver; easier motions.",
     "technique": "From The Spider, the receiver can lift their legs onto the giver’s shoulders, which increases the muscular tension that advances the orgasm sequence. By elevating their butt off the bed, it'll be easier for them to thrust and grind in circles.",
     "tip": "The giver can lean against a headboard or wall and use their hands to support the receiver’s lower back.",
     "alsoTry": ""
    ],
    ["name": "The Spider",
     "imageName": "menshealth-thespider-v2-1581103598",
     "aka": "",
     "benefits": "You both can still maintain eye contact while viewing the action at center stage.",
     "technique": "Both of you begin seated on the bed with legs toward one another, arms back to support yourselves. Then the receiver moves onto the giver. The receiver’s hips will be between the giver’s spread legs, their knees bent and feet outside of the giver’s hips and flat on the bed. Now rock back and forth.",
     "tip": "The receiver can grab the giver’s hands and pull themselves up into a squatting position while the giver lies back. Or the giver can remain seated upright and pull the receiver against their chest into the Lazy Man position.",
     "alsoTry": ""
    ],
    ["name": "Hovering Butterfly",
     "imageName": "menshealth-hoveringbutterfly-1581103629",
     "aka": "",
     "benefits": "The receiver can direct the position of the giver’s tongue and the pressure against them by rising up or pressing down.",
     "technique": "The receiver straddles the giver, placing their knees at the giver’s ears. They can hold onto a wall or headboard for support. While the giver is doing their thing, the receiver can use their fingers to graze their nipples or rub the top of their vulva.",
     "tip": "If you have the right equipment and a mutual interest in kink, the receiver can have their hands cuffed over their head.",
     "alsoTry": "The giver can hold their tongue firm as the receiver gyrates their hips, pressing their clitoris against it."
    ],
    ["name": "69",
     "imageName": "men-shealth-sexillustration-inverted-edit-1581103938",
     "aka": "Inverted 69, Over and Under",
     "benefits": "Simultaneous oral pleasure.",
     "technique": "When one partner is on top in 69, they can control the intensity of oral stimulation on their genitals by lifting or pressing their pelvis. From this position, it's easy for each person to work their finger magic on their partner’s vagina or perineum, the sensitive area just below your testicles.",
     "tip": "Place a cup of warm tea and an ice cube on the nightstand near the bed. You can alternate between placing the ice cube and then the tea in your mouth while performing oral sex to add an element of temperature play.",
     "alsoTry": "Roll over onto your sides in the 69 sex position."
    ],
    ["name": "The Face Sitter",
     "imageName": "menshealth-thefacesitter-1581103963",
     "aka": "Hovering Dragonfly",
     "benefits": "A comfortable position for the receiving partner and an erotic one for the giver.",
     "technique": "Rest a pillow behind the giver’s head. Then the receiver should straddle their shoulders and support their body by holding the bed's headboard or the wall.",
     "tip": "If the giver’s mouth becomes dry after a while, they can add some mint- or fruit-flavored lube to the receiver’s genitals.",
     "alsoTry": ""
    ],
    ["name": "The Elevator",
     "imageName": "menshealth-theelevator-1581103992",
     "aka": "The Bees Knees",
     "benefits": "Great for out-of-bedroom fellatio.",
     "technique": "The giver kneels in front of the receiver, covering their teeth with their lips and encircling the receiver’s glans with their mouth. Then the giver should slowly piston their lips up and down on the receiver’s shaft, alternating speeds and occasionally stopping to move their tongue over and around the receiver’s head.",
     "tip": "For variation, the giver can take one of the receiver’s testicles into their mouth as they stroke the shaft with their hand.",
     "alsoTry": "Lean a dressing mirror against a wall to the side of your body so the receiver can enjoy the view of their partner going down on them from the side."
    ],
    ["name": "Swiss Ball Blitz",
     "imageName": "menshealth-theswissballblitz-1581104156",
     "aka": "Romper Room",
     "benefits": "See The Hot Seat. Also, adds bounce to your thrusts.",
     "technique": "Have a ball in your workout room? Use a stability ball to add some bounce to The Hot Seat. The penetrating partner sits on the ball with their feet on the floor. Then the receiver backs up onto the giver, sitting between their legs. Roll and bounce to it",
     "tip": "The giver can lean their back against a wall for additional stability.",
     "alsoTry": ""
    ]
]
