require 'spec_helper'

describe BooksController do
  before(:each) do
    @book = create(:book)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "returns a book" do
      get 'search', search: 'the Great Gatsby'
      response.should be_success
    end
  end

  describe "GET #show" do
    it "assigns the requested book as @book" do
      get :show, id: @book
      assigns(:book).should eq(@book)
    end

    it "render the :show view" do
      get :show, id: create(:book)
      response.should render_template :show
    end
  end

  describe "POST #create" do
    describe "with valid params" do
      it "saves the new book in the database" do
        expect {
          post :create, {:book => attributes_for(:book)}
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post :create, {:book => attributes_for(:book)}
        response.should redirect_to(Book.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @book" do
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        post :create, {:book => { "title" => "invalid value" }}
        assigns(:book).should be_a_new(Book)
      end

    end
  end

  # describe "DELETE destroy" do
  #   it "destroys the requested user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => user.to_param}, valid_session
  #     }.to change(User, :count).by(-1)
  #   end

  #   it "redirects to the users list" do
  #     user = User.create! valid_attributes
  #     delete :destroy, {:id => user.to_param}, valid_session
  #     response.should redirect_to(users_url)
  #   end
  # end

end
