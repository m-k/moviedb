# frozen_string_literal: true

User.find_or_create_by!(
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)
User.find_or_create_by!(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)
