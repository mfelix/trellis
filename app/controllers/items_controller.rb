class ItemsController < ApplicationController
  
  before_filter :login_required
  
  layout 'application'
  
  # GET /items
  # GET /items.xml
  def index
    @items = User.find(current_user).items.roots.sort_by(&:updated_at).reverse
    if @items.size == 1
      
    end
        
    respond_to do |format|
      format.html {
        if @items.size <= 1
          @item = Item.find(current_user.origin)
          redirect_to(@item)
        end
      }
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])
    @background = @item.image
    respond_to do |format|
      format.html # show.html.erb (also, erb sucks)
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new()
    
    respond_to do |format|
      format.html { render :partial => "new", :layout => false }
      format.js   { render :partial => "new", :layout => false }
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    respond_to do |format|
      format.js   { render :partial => "edit", :layout => false }
    end
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    current_user.items << @item 
    parent = params[:parent_id]
    
    raise "cannot create new root" if parent.blank?
       
    respond_to do |format|
      if @item.save
        if not parent.blank?
          @item.move_to_child_of parent
        end
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item.parent) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end    
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
    end
    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
end
