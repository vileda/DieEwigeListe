class FixturesController < ApplicationController
  # GET /fixtures
  # GET /fixtures.xml
  def index
    @fixtures = Fixture.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @fixtures }
    end
  end

  # GET /fixtures/1
  # GET /fixtures/1.xml
  def show
    @fixture = Fixture.find(params[:id])
    @score_sums = sum_scores
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @fixture }
    end
  end

  def sum_scores
    sp1 = 0
    sp2 = 0
    @fixture.matches.each { |m|
      sp1 += m.score1
      sp2 += m.score2
    }

    sp1lead = sp1 >= sp2 ? true : false
    sp2lead = sp2 >= sp1 ? true : false
    return {:sp1 => sp1, :sp2 => sp2, :sp1lead => sp1lead, :sp2lead => sp2lead}
  end

  # GET /fixtures/new
  # GET /fixtures/new.xml
  def new
    @fixture = Fixture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @fixture }
    end
  end

  # GET /fixtures/1/edit
  def edit
    @fixture = Fixture.find(params[:id])
  end

  # POST /fixtures
  # POST /fixtures.xml
  def create
    params[:fixture][:player1] = Player.find(params[:fixture][:player1])
    params[:fixture][:player2] = Player.find(params[:fixture][:player2])

    @fixture = Fixture.new(params[:fixture])

    respond_to do |format|
      if @fixture.save
        format.html { redirect_to(@fixture, :notice => 'Fixture was successfully created.') }
        format.xml { render :xml => @fixture, :status => :created, :location => @fixture }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @fixture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fixtures/1
  # PUT /fixtures/1.xml
  def update
    @fixture = Fixture.find(params[:id])

    respond_to do |format|
      if @fixture.update_attributes(params[:fixture])
        format.html { redirect_to(@fixture, :notice => 'Fixture was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @fixture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fixtures/1
  # DELETE /fixtures/1.xml
  def destroy
    @fixture = Fixture.find(params[:id])
    @fixture.destroy

    respond_to do |format|
      format.html { redirect_to(fixtures_url) }
      format.xml { head :ok }
    end
  end
end
