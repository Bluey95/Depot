require 'test_helper'

# The generated ProductsonsaleTest is a subclass of ActiveSupport::TestCase
# ActiveSupport::TestCase is a subclass of the MiniTest::Test.
# Means that rails generates tests based on the MiniTest framework that comes preinstalled with Ruby.
# minitest/unit is a small and incredibly fast unit testing framework

class ProductsonsaleTest < ActiveSupport::TestCase
# loads the fixture data

fixtures :productsonsales

# placeholder

  # test "the truth" do
  #   assert true
  # end
  
  def new_productsonsale(image_url)
    Productsonsale.new(title: "My Book Title",
        description: "yyy",
        price: 1,
        image_url: image_url)
  end
  
  
  test "productsonsale attribute must not be empty" do
    productsonsale = Productsonsale.new
    assert productsonsale.invalid? 
    assert productsonsale.errors[:title].any?
    assert productsonsale.errors[:description].any?
    assert productsonsale.errors[:price].any?
    assert productsonsale.errors[:image_url].any?
   end
   
   test "productsonsale price must be positive" do
        productsonsale = Productsonsale.new(title: "My Book Title",
                            description: "yyy",
                            image_url: "zzz.jpg")
                            productsonsale.price = -1
                            assert productsonsale.invalid?
                            assert_equal ["must be greater than or equal to 0.01"],
                            productsonsale.errors[:price]
                            productsonsale.price = 0
                        assert productsonsale.invalid?
                        assert_equal ["must be greater than or equal to 0.01"],
                        productsonsale.errors[:price]
                        productsonsale.price = 1
                        assert productsonsale.valid?
end

    test "image url" do
        ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
                http://a.b.c/x/y/z/fred.gif }
        bad = %w{ fred.doc fred.gif/more fred.gif.more }
        
        ok.each do |name|
            assert new_productsonsale(name).valid?, "#{name} shouldn't be invalid"
        end
        
        bad.each do |name|
            assert new_productsonsale(name).invalid?, "#{name} shouldn't be valid"
        end
    end
    
    test "productsonsale is not valid without a unique title" do
        productsonsale = Productsonsale.new(title: products(:ruby).title,
                                            description: "yyy",
                                            price: 1,
                                            image_url: "fred.gif")
        assert productsonsale.invalid?
        assert_equal [I18n.translate('errors,messages.taken')], productsonsale.errors[:title]
end


end