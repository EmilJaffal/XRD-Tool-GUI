import os
from dash import Dash
from layout import create_layout
from callbacks import register_callbacks

# Initialize Dash app
app = Dash(__name__)

# Define WSGI-compatible server instance
server = app.server  

# Set up layout and callbacks
try:
    app.layout = create_layout(app)
    register_callbacks(app)
except Exception as e:
    print(f"Error initializing app: {e}")

# Run the app in debug mode only when executed directly
if __name__ == '__main__':
    app.run_server(debug=os.getenv('DEBUG', 'False').lower() == 'true')
