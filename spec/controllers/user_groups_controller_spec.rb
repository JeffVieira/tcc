require 'spec_helper'

describe UserGroupsController do

  # This should return the minimal set of attributes required to create a valid
  # UserGroup. As you add validations to UserGroup, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UserGroupsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  login_user

  describe "GET index" do
    it "assigns all user_groups as @user_groups" do
      user_group = UserGroup.create! valid_attributes
      get :index, {}, valid_session
      assigns(:user_groups).should eq([user_group])
    end
  end

  describe "GET show" do
    it "assigns the requested user_group as @user_group" do
      user_group = UserGroup.create! valid_attributes
      get :show, {:id => user_group.to_param}, valid_session
      assigns(:user_group).should eq(user_group)
    end
  end

  describe "GET new" do
    it "assigns a new user_group as @user_group" do
      get :new, {}, valid_session
      assigns(:user_group).should be_a_new(UserGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested user_group as @user_group" do
      user_group = UserGroup.create! valid_attributes
      get :edit, {:id => user_group.to_param}, valid_session
      assigns(:user_group).should eq(user_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new UserGroup" do
        expect {
          post :create, {:user_group => valid_attributes}, valid_session
        }.to change(UserGroup, :count).by(1)
      end

      it "assigns a newly created user_group as @user_group" do
        post :create, {:user_group => valid_attributes}, valid_session
        assigns(:user_group).should be_a(UserGroup)
        assigns(:user_group).should be_persisted
      end

      it "redirects to the created user_group" do
        post :create, {:user_group => valid_attributes}, valid_session
        response.should redirect_to(user_groups_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_group as @user_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserGroup.any_instance.stub(:save).and_return(false)
        post :create, {:user_group => { "name" => "invalid value" }}, valid_session
        assigns(:user_group).should be_a_new(UserGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserGroup.any_instance.stub(:save).and_return(false)
        post :create, {:user_group => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user_group" do
        user_group = UserGroup.create! valid_attributes
        # Assuming there are no other user_groups in the database, this
        # specifies that the UserGroup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        UserGroup.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => user_group.to_param, :user_group => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested user_group as @user_group" do
        user_group = UserGroup.create! valid_attributes
        put :update, {:id => user_group.to_param, :user_group => valid_attributes}, valid_session
        assigns(:user_group).should eq(user_group)
      end

      it "redirects to the user_group" do
        user_group = UserGroup.create! valid_attributes
        put :update, {:id => user_group.to_param, :user_group => valid_attributes}, valid_session
        response.should redirect_to(user_groups_path)
      end
    end

    describe "with invalid params" do
      it "assigns the user_group as @user_group" do
        user_group = UserGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        UserGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_group.to_param, :user_group => { "name" => "invalid value" }}, valid_session
        assigns(:user_group).should eq(user_group)
      end

      it "re-renders the 'edit' template" do
        user_group = UserGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        UserGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_group.to_param, :user_group => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user_group" do
      user_group = UserGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => user_group.to_param}, valid_session
      }.to change(UserGroup, :count).by(-1)
    end

    it "redirects to the user_groups list" do
      user_group = UserGroup.create! valid_attributes
      delete :destroy, {:id => user_group.to_param}, valid_session
      response.should redirect_to(user_groups_url)
    end
  end

end
