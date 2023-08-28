import 'package:agendamento/app/modules/home/procedimento_model.dart';
import 'package:agendamento/app/modules/reservas/reserva_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProcedimentoController {
   late CollectionReference service;
   
   
  List<ProcedimentoModel> buscarProcedimentos() {
    return [
      ProcedimentoModel(
          nome: "Limpeza Facial", descricao: "Remoção de impurezas da pele"),
      ProcedimentoModel(
          nome: "Microdermoabrasao",
          descricao: "Esfoliação suave para renovar a pele"),
      ProcedimentoModel(
          nome: "Preenchimento Labial",
          descricao: "Aumento dos lábios para efeito estético"),
      ProcedimentoModel(
          nome: "Botox",
          descricao: "Tratamento para suavizar rugas e linhas de expressão"),
      ProcedimentoModel(
          nome: "Peeling Quimico",
          descricao:
              "Aplicação de substâncias para descamar e revitalizar a pele"),
      ProcedimentoModel(
          nome: "Depilacao Laser",
          descricao: "Remoção de pelos indesejados com laser"),
      ProcedimentoModel(
          nome: "Manicure Francesa",
          descricao: "Aplicação de esmalte de forma clássica e elegante"),
      ProcedimentoModel(
          nome: "Design Sobrancelhas",
          descricao: "Modelagem das sobrancelhas para realçar o olhar"),
      ProcedimentoModel(
          nome: "Tratamento CabeloQuimico",
          descricao: "Aplicação de produtos para transformação capilar"),
      ProcedimentoModel(
          nome: "Massagem Relaxante",
          descricao: "Massagem suave para relaxamento do corpo"),
      ProcedimentoModel(
          nome: "Lifting Facial",
          descricao: "Procedimento para rejuvenescimento e firmeza da pele"),
    ];
  }
  save(ReservaModel resevaModel) async {
    await service.add(resevaModel.toMap());
  }
}
