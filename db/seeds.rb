#---
# Excerpted from "Agile Web Development with Rails 5",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails5 for more book information.
#---
# encoding: utf-8
Productsonsale.delete_all
Productsonsale.create(title: 'Eye Lashes',
  description:
    %{<p>
      <em>Eye lashes</em>
      Get the best quality eye lashes from our store.
      </p>},
  image_url: 'eyelashes.jpg',    
  price: 150.00)
# . . .
Productsonsale.create(title: 'Eye Make Up',
  description:
    %{<p>
      <em>Complete eye make up set</em>
      A complete set of eye makeup. Contains eyelashes, mascara, eye shadow, eye liner, eye pencil 
      and a sealer.
      </p>},
  image_url: 'eyes.png',
  price: 700.00)
# . . .

Productsonsale.create(title: 'Face Make Up',
  description:
    %{<p>
      <em>Complete Facial Makeup</em>
      A complete set of facial make up from Make Up Forever. Contains a primer, concealer, foundation, powder,
      bronzer, blush, luminizer and a sealer.
      </p>},
  image_url: 'face(muf).jpg',
  price: 1000.00)
  
  Productsonsale.create(title: 'THREE-D-NAILS',
description:
%{<p>
<em>3D NAILS</em>
This type of nail art is very innovative. You can pick bow-ties, hearts, happy faces, or whichever design you wish fo
</p>},
image_url: '3D.jpg',
price: 1500.00)

Product.delete_all
Product.create(title: '3-D NAILS',
  description:
    %{<p>
      <em>3-D Nails Manicure</em>
      Get the best 3-D nails from our beauty parlour. Great looking nails give you the right confidence. 
      </p>},
  image_url: '3D.jpg',    
  price: 45.00)
# . . .
Product.create(title: 'Air Brushed Nails',
  description:
    %{<p>
      <em>Air brushed Nails Manicure</em>
       Nail polish not working for you? Try using an airbrush. It's quick and perfect. Less Mess. Less Stress.
      </p>},
  image_url: 'air.jpg',
  price: 26.00)
# . . .

Product.create(title: 'American Manicure',
  description:
    %{<p>
      <em>American Manicure</em>
      Forego the classic, stark-white tip for a more neutral one, 
      creating an even more natural, blended look. 
      Rather than painting (or airbrushing) the nail tip white, 
      an American manicure goes with an ivory, off-white or pale nude. 
      Achieve a near-natural look that is nonetheless luxuriously manicured.</em>
      </p>},
  image_url: 'american.jpg',
  price: 46.00)
  
  Product.create(title: 'Aromatherapy',
description:
%{<p>
<em>Aromatherapy Massage</em>
This involves the practice of using the natural oils extracted from flowers, bark, stems, leaves, 
roots or other parts of a plant to enhance psychological and physical well-being. 
It is used for a variety of applications, including pain relief, mood enhancement and increased cognitive function.</p>},
image_url: '3D.jpg',
price: 1500.00)

