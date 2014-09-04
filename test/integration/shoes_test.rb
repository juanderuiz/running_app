require 'test_helper'

class ShoesTest < ActionDispatch::IntegrationTest

  test "can see EMPTY list of shoes without login" do
    visit root_url
  	click_link "Sus Zapatillas"
  	assert has_content? 'No shoes Available!'
  end

  test "can see LIST of shoes without login" do
    shoe = FactoryGirl.create(:shoe)
    visit root_url
    click_link "Sus Zapatillas"
    assert has_content? 'Nuestras mejores armas, ¡devoran kilómetros!'
  end

  test "when login can see my list of shoes" do
    visit root_url
    #runner = FactoryGirl.create(:runner)
    shoe = FactoryGirl.create(:shoe)
    login_as(shoe.runner, :scope => :runner)
    click_link "Iniciar Sesión"
    click_link "Mi perfil"
    click_link "Mis Zapatillas"
    assert has_selector? '.shoe'
    assert has_selector? '.acciones'
  end

end