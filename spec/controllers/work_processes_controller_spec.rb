require 'spec_helper'

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

describe WorkProcessesController do

  # This should return the minimal set of attributes required to create a valid
  # WorkProcess. As you add validations to WorkProcess, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkProcessesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all work_processes as @work_processes" do
      work_process = WorkProcess.create! valid_attributes
      get :index, {}, valid_session
      assigns(:work_processes).should eq([work_process])
    end
  end

  describe "GET show" do
    it "assigns the requested work_process as @work_process" do
      work_process = WorkProcess.create! valid_attributes
      get :show, {:id => work_process.to_param}, valid_session
      assigns(:work_process).should eq(work_process)
    end
  end

  describe "GET new" do
    it "assigns a new work_process as @work_process" do
      get :new, {}, valid_session
      assigns(:work_process).should be_a_new(WorkProcess)
    end
  end

  describe "GET edit" do
    it "assigns the requested work_process as @work_process" do
      work_process = WorkProcess.create! valid_attributes
      get :edit, {:id => work_process.to_param}, valid_session
      assigns(:work_process).should eq(work_process)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WorkProcess" do
        expect {
          post :create, {:work_process => valid_attributes}, valid_session
        }.to change(WorkProcess, :count).by(1)
      end

      it "assigns a newly created work_process as @work_process" do
        post :create, {:work_process => valid_attributes}, valid_session
        assigns(:work_process).should be_a(WorkProcess)
        assigns(:work_process).should be_persisted
      end

      it "redirects to the created work_process" do
        post :create, {:work_process => valid_attributes}, valid_session
        response.should redirect_to(WorkProcess.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved work_process as @work_process" do
        # Trigger the behavior that occurs when invalid params are submitted
        WorkProcess.any_instance.stub(:save).and_return(false)
        post :create, {:work_process => { "name" => "invalid value" }}, valid_session
        assigns(:work_process).should be_a_new(WorkProcess)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        WorkProcess.any_instance.stub(:save).and_return(false)
        post :create, {:work_process => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested work_process" do
        work_process = WorkProcess.create! valid_attributes
        # Assuming there are no other work_processes in the database, this
        # specifies that the WorkProcess created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        WorkProcess.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => work_process.to_param, :work_process => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested work_process as @work_process" do
        work_process = WorkProcess.create! valid_attributes
        put :update, {:id => work_process.to_param, :work_process => valid_attributes}, valid_session
        assigns(:work_process).should eq(work_process)
      end

      it "redirects to the work_process" do
        work_process = WorkProcess.create! valid_attributes
        put :update, {:id => work_process.to_param, :work_process => valid_attributes}, valid_session
        response.should redirect_to(work_process)
      end
    end

    describe "with invalid params" do
      it "assigns the work_process as @work_process" do
        work_process = WorkProcess.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WorkProcess.any_instance.stub(:save).and_return(false)
        put :update, {:id => work_process.to_param, :work_process => { "name" => "invalid value" }}, valid_session
        assigns(:work_process).should eq(work_process)
      end

      it "re-renders the 'edit' template" do
        work_process = WorkProcess.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WorkProcess.any_instance.stub(:save).and_return(false)
        put :update, {:id => work_process.to_param, :work_process => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested work_process" do
      work_process = WorkProcess.create! valid_attributes
      expect {
        delete :destroy, {:id => work_process.to_param}, valid_session
      }.to change(WorkProcess, :count).by(-1)
    end

    it "redirects to the work_processes list" do
      work_process = WorkProcess.create! valid_attributes
      delete :destroy, {:id => work_process.to_param}, valid_session
      response.should redirect_to(work_processes_url)
    end
  end

end
