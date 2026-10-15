# Minerva Orta

Página preparada para GitHub Pages. **Pendiente conectar Supabase antes de activar Pages.**

## Configuración
1. Crear un proyecto Supabase.
2. Ejecutar `database/setup.sql` en SQL Editor.
3. Completar `config.js` con Project URL y clave pública anon/publishable. Nunca subir contraseñas ni claves secretas/service_role.
4. Probar el envío y confirmar el registro en Table Editor → contact_requests. La política RLS permite insertar y prohíbe la lectura pública.
5. En GitHub: Settings → Pages → Deploy from a branch → main / (root) → Save.

Las solicitudes se consultarán en el panel privado de Supabase. El panel y contraseña de la versión Sites no se trasladan a GitHub Pages. Los registros anteriores permanecen en la base de datos anterior; no se han migrado.

Antes de una difusión amplia conviene añadir protección de servidor contra envíos masivos.
