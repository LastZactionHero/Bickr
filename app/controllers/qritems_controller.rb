require "base64"
require 'uri'

class QritemsController < ApplicationController
  # GET /qritems
  # GET /qritems.xml
  def index
    @qritems = Qritem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qritems }
    end
  end

  # GET /qritems/1
  # GET /qritems/1.xml
  def show
    @qritem = Qritem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qritem }
    end
  end

  # GET /qritems/new
  # GET /qritems/new.xml
  def new
    @qritem = Qritem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qritem }
    end
  end

  # GET /qritems/1/edit
  def edit
    @qritem = Qritem.find(params[:id])
  end

  # POST /qritems
  # POST /qritems.xml
  def create
    @qritem = Qritem.new(params[:qritem])

    respond_to do |format|
      if @qritem.save
        format.html { redirect_to(@qritem, :notice => 'Qritem was successfully created.') }
        format.xml  { render :xml => @qritem, :status => :created, :location => @qritem }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qritem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qritems/1
  # PUT /qritems/1.xml
  def update
    @qritem = Qritem.find(params[:id])

    respond_to do |format|
      if @qritem.update_attributes(params[:qritem])
        format.html { redirect_to(@qritem, :notice => 'Qritem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qritem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qritems/1
  # DELETE /qritems/1.xml
  def destroy
    @qritem = Qritem.find(params[:id])
    @qritem.destroy

    respond_to do |format|
      format.html { redirect_to(qritems_url) }
      format.xml  { head :ok }
    end
  end
  
  # GENERATE /qritems/generate
  # Create a new QR item
  def generate
    
    # Create a unique tag name
    entry_count = Qritem.all.size
    @tag = Base64.encode64("X" + entry_count.to_s)
    @tag = @tag.gsub("=", "x")
    
    # Generate URL for unique item
    @tag_url = "http://bickr.heroku.com/view/" + @tag
    
    # Create a QR code url from this tag name using the Google API
    @qr_url = "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=" + URI.escape(@tag_url) + "%0A"

    # Save this tag
    @new_qr_item = Qritem.new
    @new_qr_item.tag = @tag.strip
    @new_qr_item.url = @qr_url
    @new_qr_item.save
    
  end

  # VIEW /:id
  # View a QR item
  def view    
    @tag = params[:id].to_s.strip      
    @item = Qritem.find( :first, :conditions => ["tag = '#{@tag}'"] )      
    
  end

  
end
