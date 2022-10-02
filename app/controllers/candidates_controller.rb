class CandidatesController < ApplicationController

  def index
    render json: {
      data: CandidateSerializer.new(Candidate.all).serializable_hash
    }, status: :ok
  end

  def update
        unless params[:reject_it].nil?
            c = Candidate.find(params[:id])
            c.status = 0
            c.save
        else
          c = Candidate.find(params[:id])
          c.status = 2
          c.save

          c.vacancy.closing_date = Date.today
          c.vacancy.status = true
          c.vacancy.save

          c.vacancy.candidates.each do |cand|
            unless cand.status == 2
                cand.status = 0
                cand.save
            end
          end
        end

        respond_to do |format|
            format.js {render inline: "location.reload();" }
          end
  end


  def create

    print params

    if params[:gender]=="male"
      male = true
    else
      male = false
    end

    @c = Candidate.new(
      user: current_user,
      first_name: params[:first_name],
      second_name: params[:second_name],
      email: params[:email],
      number: params[:number],
      expirience_years: params[:exp].to_f,
      biography: params[:bio],
      gender: male,
      status: 1,
      vacancy: Position.find_by_name(params[:vacancy_name]).vacancies.first
    )

    unless params[:candidate].nil?
        @c.avatar = params[:candidate][:avatar]
    end

    @c.save

    Criterium.all.each_with_index do |c, idx|
      CandidateCriteriumScore.create(
        score: params["criterium_#{idx+1}"].to_i,
        candidate: Candidate.last,
        criterium: c
      )
    end

    redirect_to candidates_path



  end




end
