require 'test_helper'

class RunnersTest < ActionDispatch::IntegrationTest

  test "in the root url" do
  	visit root_url
  	assert has_selector? '#mainlink'
  	assert has_content? 'Nuestros Runners'
  	assert has_link? 'The Running Project v1.0'
  end

  test "can log in with Devise" do
  	visit root_url
  	#https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
  	runner = FactoryGirl.create(:runner)
    login_as(runner, :scope => :runner)
    click_link "Iniciar Sesión"
  	assert has_link? 'Mis zapatillas'
  	assert has_link? 'Mi perfil'
  end

  test "can logout" do
    visit root_url
    runner = FactoryGirl.create(:runner)
    login_as(runner, :scope => :runner)
    click_link "Iniciar Sesión"
    assert has_link? "Cerrar Sesión"
    click_link "Cerrar Sesión"
    assert has_link? "Iniciar Sesión"
  end

  test "can see list of runners without login but is EMPTY" do
  	visit root_url
  	click_link "Nuestros Runners"
  	assert has_link? '¿Quieres ser el primero?'
  end

  test "can see list of with 3 runners" do
    runner = FactoryGirl.create(:runner)
    runner2 = FactoryGirl.create(:runner)
    runner3 = FactoryGirl.create(:runner)
    visit root_url
    click_link "Nuestros Runners"
    assert has_link? '¡Únete a ellos!'
    assert has_selector?('tr.corredor', count:3)
  end

end
