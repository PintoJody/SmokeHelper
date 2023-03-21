import 'package:flutter/material.dart';

import '../service/auth_token_service.dart';
import '../service/deleteUserService.dart';
import '../theme/theme.dart';

class DeleteUserButton extends StatelessWidget {
  final AuthService _authService = AuthService();
  final String userId;

  DeleteUserButton({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(CustomTheme.errorColor),
      ),
      onPressed: () async {
        final shouldDelete = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirmation'),
            content: Text('Etes-vous sûr de vouloir supprimer votre compte ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Annuler'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Supprimer'),
              ),
            ],
          ),
        );
        if (shouldDelete) {
          final success = await deleteUserService(userId);
          if (success) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Compte supprimé')),
            );
            //
            //Delete datas user
            await _authService.deleteAllTokens();
            // Redirection
            //TODO problème redirection
            Navigator.pushNamedAndRemoveUntil(context, '/LoginView', (route) => false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Echec de la suppression')),
            );
          }
        }
      },
      child: Text('Supprimer mon compte',),
    );
  }
}
