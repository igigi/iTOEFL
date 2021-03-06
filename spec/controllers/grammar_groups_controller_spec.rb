require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe GrammarGroupsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # GrammarGroup. As you add validations to GrammarGroup, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GrammarGroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all grammar_groups as @grammar_groups" do
      grammar_group = GrammarGroup.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:grammar_groups)).to eq([grammar_group])
    end
  end

  describe "GET show" do
    it "assigns the requested grammar_group as @grammar_group" do
      grammar_group = GrammarGroup.create! valid_attributes
      get :show, {:id => grammar_group.to_param}, valid_session
      expect(assigns(:grammar_group)).to eq(grammar_group)
    end
  end

  describe "GET new" do
    it "assigns a new grammar_group as @grammar_group" do
      get :new, {}, valid_session
      expect(assigns(:grammar_group)).to be_a_new(GrammarGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested grammar_group as @grammar_group" do
      grammar_group = GrammarGroup.create! valid_attributes
      get :edit, {:id => grammar_group.to_param}, valid_session
      expect(assigns(:grammar_group)).to eq(grammar_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GrammarGroup" do
        expect {
          post :create, {:grammar_group => valid_attributes}, valid_session
        }.to change(GrammarGroup, :count).by(1)
      end

      it "assigns a newly created grammar_group as @grammar_group" do
        post :create, {:grammar_group => valid_attributes}, valid_session
        expect(assigns(:grammar_group)).to be_a(GrammarGroup)
        expect(assigns(:grammar_group)).to be_persisted
      end

      it "redirects to the created grammar_group" do
        post :create, {:grammar_group => valid_attributes}, valid_session
        expect(response).to redirect_to(GrammarGroup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved grammar_group as @grammar_group" do
        post :create, {:grammar_group => invalid_attributes}, valid_session
        expect(assigns(:grammar_group)).to be_a_new(GrammarGroup)
      end

      it "re-renders the 'new' template" do
        post :create, {:grammar_group => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested grammar_group" do
        grammar_group = GrammarGroup.create! valid_attributes
        put :update, {:id => grammar_group.to_param, :grammar_group => new_attributes}, valid_session
        grammar_group.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested grammar_group as @grammar_group" do
        grammar_group = GrammarGroup.create! valid_attributes
        put :update, {:id => grammar_group.to_param, :grammar_group => valid_attributes}, valid_session
        expect(assigns(:grammar_group)).to eq(grammar_group)
      end

      it "redirects to the grammar_group" do
        grammar_group = GrammarGroup.create! valid_attributes
        put :update, {:id => grammar_group.to_param, :grammar_group => valid_attributes}, valid_session
        expect(response).to redirect_to(grammar_group)
      end
    end

    describe "with invalid params" do
      it "assigns the grammar_group as @grammar_group" do
        grammar_group = GrammarGroup.create! valid_attributes
        put :update, {:id => grammar_group.to_param, :grammar_group => invalid_attributes}, valid_session
        expect(assigns(:grammar_group)).to eq(grammar_group)
      end

      it "re-renders the 'edit' template" do
        grammar_group = GrammarGroup.create! valid_attributes
        put :update, {:id => grammar_group.to_param, :grammar_group => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested grammar_group" do
      grammar_group = GrammarGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => grammar_group.to_param}, valid_session
      }.to change(GrammarGroup, :count).by(-1)
    end

    it "redirects to the grammar_groups list" do
      grammar_group = GrammarGroup.create! valid_attributes
      delete :destroy, {:id => grammar_group.to_param}, valid_session
      expect(response).to redirect_to(grammar_groups_url)
    end
  end

end
