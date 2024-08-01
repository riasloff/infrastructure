# infrastructure
infrastructure for riasloff.ru: tf, k8s, etc.

IaC для создание собственного кластрера kubernetes у провайдера Selectel,
с помощью terraform. Особенность инфраструктуры в том, что она построенна 
на публичной подсети, в ставится в двух регионах, ru-9 и kz-1.


Перед стартом необходимо добавить в переменное окружение след.:

  * `export TF_VAR_selectel_svc_password=' '` - Пароль от сервисного пользователя, созданного предварительно.

  * `export TF_VAR_project_user_password=' '` - Сложный пароль, который будет использоваться для провайдера openstack.

Документация selectel: https://docs.selectel.ru/terraform/