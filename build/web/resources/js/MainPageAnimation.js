/* global consol */

const hero = document.querySelector('.BackImg2');
const slider = document.querySelector('.slider');
const logo = document.querySelector('#logo');


console.log("qsdqd");

const t1 = new  TimelineMax();

t1.fromTo(
        hero,
0.5,
{height:'0%'},
{height:"90%",ease: Power2.easeInOut}
        ).fromTo(
        hero,
0.5,
{width:'100%'},
{width:'80%',ease: Power2.easeInOut}
        ).fromTo(slider,1.2,{x:'-100%'},{x:'0%',ease: Power2.easeInOut},"-m1.2").
        fromTo(logo,
                1,
                {
                    visibility:'visible'
                },
                {
                     visibility: 'hidden',
                     ease: Power2.easeInOut
                }
                        
        );