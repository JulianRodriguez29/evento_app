class EventosController < ApplicationController
  def index
    @eventos = Evento.all
  end

  def show
    @evento = Evento.find(params[:id])
  end

  def reservar
    @evento = Evento.find(params[:id])
  end

  def confirmar_reservacion
    @evento = Evento.find(params[:id])
  end
end
