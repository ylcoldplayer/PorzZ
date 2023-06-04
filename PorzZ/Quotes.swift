//
//  Quotes.swift
//  PorzZ
//
//  Created by Yuanlong Chen on 6/3/23.
//

import Foundation

struct Quotes {
    static let shared = Quotes()
    
    var allQuotes = [
        "It’s work having a vagina. Guys don’t think that it’s work but it is. You think it shows up like that to the event? It doesn’t. Every night it’s like getting it ready for its first Quinceanera, believe me. — Amy Schumer",
        "Good sex is like good bridge. If you don’t have a good partner, you’d better have a good hand. ― Mae West",
        "We have reason to believe that man first walked upright to free his hands for masturbation. ― Lily Tomlin",
        "We have reason to believe that man first walked upright to free his hands for masturbation. ― Lily Tomlin",
        "If you wear a short enough skirt, the party will come to you. ― Dorothy Parker",
        "Usually I’m on top to keep the guy from escaping. — Lisa Lampanelli",
        "In my sex fantasy, nobody ever loves me for my mind. — Nora Ephron",
        "I think we can all agree that sleeping around is a great way to meet people. — Chelsea Handler",
        "Women fake orgasms and men fake finances. ― Suze Orman",
        "My boyfriend and I live together, which means we don’t have sex—ever. Now that the milk is free, we’ve both become lactose intolerant. — Margaret Cho",
        "I like threesomes with two women, not because I’m a cynical sexual predator. Oh no! But because I’m a romantic. I’m looking for “The One.” And I’ll find her more quickly if I audition two at a time. – Russell Brand",
        "Publishing a sophisticated men’s magazine seemed to me the best possible way of fulfilling a dream I’d been nurturing ever since I was a teenager: to get laid a lot. – Hugh Hefner",
        "Skiing is better than sex actually, because for me a good round of sex might be seven minutes. Skiing you can do for seven hours. – Spalding Gray",
        "If I’m not interested in a woman, I’m straight-forward. Right after sex, I usually say, ‘I can’t do this anymore. Thanks for coming over!' –– Vince Vaughn",
        "It’s been so long since I’ve had sex I’ve forgotten who ties up whom. – Joan Rivers",
        "If you want to get laid, go to college. If you want an education, go to the library. – Frank Zappa",
        "Women need a reason to have sex. Men just need a place. – Billy Crystal",
        "Is one expected to be a gentleman when one is stiff? – Marquis de Sade",
        "I have no objection to anyone’s sex life as long as they don’t practice it in the street and frighten the horses. ― Oscar Wilde",
        "Sex appeal is fifty percent what you’ve got and fifty percent what people think you’ve got. — Sophia Loren",
        "Some things are better than sex, and some are worse, but there’s nothing exactly like it. — W. C. Fields",
        "An intellectual is a person who’s found one thing that’s more interesting than sex. — Aldous Huxley",
        "Sex without love is merely healthy exercise. — Robert A. Heinlein",
        "Money, it turned out, was exactly like sex, you thought of nothing else if you didn’t have it and thought of other things if you did. — James A. Baldwin",
        "There’s nothing better than good sex. But bad sex? A peanut butter and jelly sandwich is better than bad sex. — Billy Joel",
        "Sex: the thing that takes up the least amount of time and causes the most amount of trouble. — John Barrymore",
        "When I’m good, I’m very good, but when I’m bad, I’m better. ― Mae West",
        "There are four basic human needs; food, sleep, sex and revenge. — Banksy",
        "Dancing is a perpendicular expression of a horizontal desire. — George Bernard Shaw",
        "Sex should be friendly. Otherwise stick to mechanical toys; it’s more sanitary. — Robert A. Heinlein",
        "If a man doesn’t know how to dance he doesn’t know how to make love, there I said it! — Craig Ferguson",
        "What holds the world together, as I have learned from bitter experience, is sexual intercourse. — Henry Miller",
        "The best revenge, like the best sex, is performed slowly, and with the eyes open. — Gregory David Roberts",
        "Sex is like air; it’s not important unless you aren’t getting any. — John Callahan",
        "What a strange world this is when you can have as much sex as you like but love is taboo. — Jeanette Winterson",
        "Physics is like sex: sure, it may give some practical results, but that’s not why we do it. ― Richard Feynman",
        "To have her here in bed with me, breathing on me, her hair in my mouth — I count that something of a miracle. – Henry Miller",
        "I am not saying renounce sex, I am saying transform it. It need not remain just biological: bring some spirituality to it. While making love, meditate too. While making love, be prayerful. Love should not be just a physical act; pour your soul into it. – Osho",
        "The sexual embrace can only be compared with music and with prayer. – Marcus Aurelius",
        "Sex is a momentary itch, love never lets you go. — Kingsley Amis",
        "Sex is emotion in motion. — Mae West",
        "Love is an ice cream sundae, with all the marvelous coverings. Sex is the cherry on top. — Jimmy Dean",
        "Sex without love is as hollow and ridiculous as love without sex. ― Hunter S. Thompson",
        "A gentleman holds my hand. A man pulls my hair. A soulmate will do both. — Alessandra Torre",
        "Nobody dies from the lack of sex. It’s lack of love we die from. — Margaret Atwood",
        "Everything in the world is about sex except sex. Sex is about power. – Oscar Wilde",
        "Sex is always about emotions. Good sex is about free emotions; bad sex is about blocked emotions. – Deepak Chopra",
        "Boys and girls in America have such a sad time together; sophistication demands that they submit to sex immediately without proper preliminary talk. Not courting talk  real straight talk about souls, for life is holy and every moment is precious. – Jack Kerouac"
    ]
    private init() {
        
    }
}

//“The way you make love is the way God will be with you.” –– Rumi
//
//“We demand that sex speak the truth […] and we demand that it tell us our truth, or rather, the deeply buried truth of that truth about ourselves which we think we possess in our immediate consciousness.” –– Michel Foucault
//
//“When sex involves all the senses intensely, it can be like a mystical experience.” — Jim Morrison
//
//“The major civilizing force in the world is not religion, it is sex.” — Hugh Hefner
//
//“Sex is about anticipation not culmination.” ― Chloe Thurlow
//
//“Everybody says sex is obscene. The only true obscenity is war.” — Henry Miller
//
//“Sex is a big question mark. It is something people will talk about forever.” — Catherine Deneuve
//
//“Sex is a part of nature. I go along with nature.” –– Marilyn Monroe
//
//“Sex is… perfectly natural. It’s something that’s pleasurable. It’s enjoyable and it enhances a relationship. So why don’t we learn as much as we can about it and become comfortable with ourselves as sexual human beings because we are all sexual?” –– Sue Johanson
//
//“Sex lies at the root of life, and we can never learn to reverence life until we know how to understand sex.” –– Havelock Ellis
//
//“Sex is not the answer. Sex is the question. “Yes” is the answer.” –– Swami X
//
//“Sex is as important as eating or drinking and we ought to allow the one appetite to be satisfied with as little restraint or false modesty as the other.” –– Marquis de Sade
//
//“I think it is funny that we were freer about sexuality in the 4th century B.C. It is a little disconcerting.” –– Angelina Jolie
//
//“The only unnatural sex act is that which you cannot perform.” –– Alfred Kinsey
//
//“My sexuality is not an inferior trait that needs to be chaperoned by emotionalism or morality.”–– Alice Bag
//
//“Sex is the driving force on the planet. We should embrace it, not see it as the enemy.” — Hugh Hefner
//
//“I need more sex, OK? Before I die I wanna taste everyone in the world.” — Angelina Jolie
//
//“Sex is not a mechanical act that fails for lack of technique, and it is not a performance by the male for the audience of the female; it is a continuum of attraction that extends from the simplest conversation and the most innocent touching through the act of coitus.” –– Garrison Keillor
//
//“Sex is a natural function. You can’t make it happen, but you can teach people to let it happen.” — William Masters
//
//“Sex is good. Everybody does it, and everybody should!” — Robbie Williams
//
//“Sex is like money; only too much is enough.” — John Updike
//
//“Sex is a two-way treat.” — Franklin P. Jones
//
//“We are all born sexual creatures, thank God, but it’s a pity so many people despise and crush this natural gift.” ― Marilyn Monroe
//
//“Sex: In America an obsession. In other parts of the world a fact.” ― Marlene Dietrich
//
//“I live for sex. I celebrate it, and relish the electricity of it, with every fibre of my being. I can see no better reason for being alive.” ― Fiona Thrust
//
//“We don’t ask when people age out of singing, or eating ice cream; why would we stop making love?” ― Ashton Applewhite
//
//“And yet another moral occurs to me now: Make love when you can. It’s good for you.” — Kurt Vonnegut
//
//“Sex pretty much cures everything.” — Chuck Palahniuk
//
//“Sex is not only the basis of life, it is the reason for life.” — Norman Lindsay
//
//“Don’t have sex with the windows open. Love may be blind but the neighbors aren’t.” –– Shawn Alff
//
//“It isn’t premarital sex if you have no intention of getting married.” –– George Burns
//
//“Sex at age 90 is like trying to shoot pool with a rope.” –– George Burns
//
//“Remember, sex is like a Chinese dinner. It ain’t over ’til you both get your cookie.” — Alec Baldwin
//
//“If it wasn’t for pick-pockets I’d have no sex life at all.” — Rodney Dangerfield
//
//“Evolution has programmed our brains to find two things particularly interesting, and therefore memorable: jokes and sex – and especially, it seems, jokes about sex.” — Joshua Foer
//
//“I’m a heroine addict. I need to have sex with women who have saved someone’s life.” — Mitch Hedberg
//
//“A man is basically as faithful as his options.” –– Chris Rock
//
//“Humans love sex, we need sex, it’s how we connect, it reminds us we’re alive, it’s the third most basic human need, after food and good movie popcorn.” — Billy Crystal
//
//“I am always looking for meaningful one night stands.” –– Dudley Moore
//
//“I need sex for a clear complexion, but I’d rather do it for love.” — Joan Crawford
//
//“Don’t put off till tomorrow anyone you could be doing today.” — Emma Chase
//
//“Once you finish having sex, what is there to do but start over?” — Jarod Kintz
