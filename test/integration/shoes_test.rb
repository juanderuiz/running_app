require 'test_helper'

class ShoesTest < ActionDispatch::IntegrationTest

  test "can see EMPTY list of shoes without login" do
    visit root_url
  	click_link "Sus Zapatillas"
  	assert has_content? 'No shoes Available!'
  end

  test "can see the LIST of everyone shoes without login" do
    shoe = FactoryGirl.create(:shoe)
    visit root_url
    click_link "Sus Zapatillas"
    assert has_content? 'Nuestras mejores armas, ¡devoran kilómetros!'
  end

  test "when login can see my EMPTY list of shoes" do
    visit root_url
    runner = FactoryGirl.create(:runner)
    #shoe = FactoryGirl.create(:shoe)
    login_as(runner, :scope => :runner)
    click_link "Iniciar Sesión"
    click_link "Mi perfil"
    click_link "Mis Zapatillas"
    assert has_selector?('h3', text: "No shoes Available!")
  end

  test "when login can see my list with the NUMBER of shoes" do
    visit root_url
    runner = FactoryGirl.create(:runner_with_shoes, shoes_count: 6)
    login_as(runner, :scope => :runner)
    click_link "Iniciar Sesión"
    #click_link "Mi perfil"
    click_link "Mis zapatillas"
    assert has_selector?('#shoes div')
    assert has_selector?('.shoe div', count:6)
    #assert has_selector?('.acciones div', count:6)
    assert has_selector?('h4', count:14) # (shoes*2)+2
    assert has_selector?('h3', text: "Lista de zapatillas de #{runner.name}")
  end

end
