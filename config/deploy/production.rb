set :user, 'ubuntu'
set :stage, :production

# Pass varibale to deploy from different git branches
set :branch, 'master'

# Setup IP with ec2 server
server '18.220.8.150', user: fetch(:user), roles: %w[app web db]
