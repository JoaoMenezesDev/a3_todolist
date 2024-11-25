import 'package:a3_teste/model/todo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseServices {
  final CollectionReference todoCollection =
      FirebaseFirestore.instance.collection("todos");

  User? user = FirebaseAuth.instance.currentUser;

// Função de adicionar tarefa
  Future<DocumentReference> addTodoItem(
      String title, String description) async {
    return await todoCollection.add({
      'uid': user!.uid,
      'title': title,
      'description': description,
      'completed': false,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

// Função para editar tarefa
  Future<void> updateTodo(String id, String title, String description) async {
    final updatetodoCollection =
        FirebaseFirestore.instance.collection("todos").doc(id);
    return await updatetodoCollection.update({
      'title': title,
      'description': description,
    });
  }

//Função para atualizar o status da tarefa
  Future<void> updateTodoStatus(String id, bool completed) async {
    return await todoCollection.doc(id).update({'completed': completed});
  }

// Função para deletar a tarefa
  Future<void> deleteTodoTask(String id) async {
    return await todoCollection.doc(id).delete();
  }

// Função para tarefas que ainda estão pendentes
  Stream<List<Todo>> get todos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: false)
        .snapshots()
        .map(_todoListFromSnapshot);
  }

// Função para tarefas que estão completas
  Stream<List<Todo>> get completedtodos {
    return todoCollection
        .where('uid', isEqualTo: user!.uid)
        .where('completed', isEqualTo: true)
        .snapshots()
        .map(_todoListFromSnapshot);
  }

  List<Todo> _todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Todo(
          id: doc.id,
          title: doc['title'] ?? '',
          description: doc['description'] ?? '',
          completed: doc['completed'] ?? false,
          timeStamp: doc['createdAt'] ?? '');
    }).toList();
  }
}
