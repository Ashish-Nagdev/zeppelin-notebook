#Import libraries
import dash
import dash_core_components as dcc
import dash_bootstrap_components as dbc
import dash_html_components as html
import dash_table
import pandas as pd
import plotly.figure_factory as ff
import plotly.graph_objs as go
import plotly.express as px
import base64
import random
import datetime 
import json

from dash.dependencies import Input, Output
from plotly.offline import plot
from wordcloud import WordCloud,STOPWORDS
from io import BytesIO

from nltk.sentiment.vader import SentimentIntensityAnalyzer

analyser = SentimentIntensityAnalyzer()

#from sqlalchemy import create_engine
#import pandas as pd
#engine = create_engine('mysql+pymysql://root:root@127.0.0.1/dbo', echo=False)
#df = pd.read_sql_query('SELECT * FROM mytable', engine, index_col = 'ID')


#Read dataset
df = pd.read_csv("""C:\\Users\\Ashish\\Documents\\insights-exam-ashish\\data\\raw\\2020-05-28\\merge_ticket_user_groups_df.csv""", sep='|', index_col=False,
                    names=['Id','CreatedOn','UpdatedOn','Title','Desc','Status','Source','TotalTime','TotalCount','ClosedAt','Text','CompanyId','UserId','SegmentId','GroupId','Text_sentiment_score','predicted_text_sentiment'], skiprows=[0])

#List of dataset columns
available_indicators = list(df)

# dropdown options
features = df.columns[15:16]
#features = available_indicators
opts = [{'label' : i, 'value' : i} for i in features]

# range slider options
df['CreatedOn'] = pd.to_datetime(df.CreatedOn, utc=False)


df['UpdatedOn'] = pd.to_datetime(df.UpdatedOn, utc=False)
df['ClosedAt'] = pd.to_datetime(df.ClosedAt, utc=False)
#df['CreatedOn'] = pd.to_datetime(df['CreatedOn'], format='%Y-%m-%d').dt.date
dates = ['2015-02-17', '2015-05-17', '2015-08-17', '2015-11-17',
         '2016-02-17', '2016-05-17', '2016-08-17', '2016-11-17', '2017-02-17']
         
         
# Step 3. Create a plotly figure
trace_1 = go.Scatter(x = df.CreatedOn, y = df['Text_sentiment_score'],
                    name = 'Text_sentiment_score',
                    line = dict(width = 2,
                                color = 'rgb(229, 151, 50)'))
layut = go.Layout(title = 'Time Series Plot', hovermode = 'closest')
fig = go.Figure(data = [trace_1], layout = layut)

stopwordss = set(STOPWORDS)
stopwordss.add("the")
stopwordss.add("to")
stopwordss.add("and")
stopwordss.add("i")
wc = WordCloud(stopwords=stopwordss, background_color='white', collocations=False, width=700, height=300)


df_positive_formatting = df.nlargest(2,'Text_sentiment_score')
df_positive_formatting = df_positive_formatting[['Id','CreatedOn','Text_sentiment_score','predicted_text_sentiment']]
df_negative_formatting = df.nsmallest(2,'Text_sentiment_score')
df_negative_formatting = df_negative_formatting[['Id','CreatedOn','Text_sentiment_score','predicted_text_sentiment']]

vaderList = ['neg', 'neu', 'pos', 'compound']

#Initialize Dash
app = dash.Dash(suppress_callback_exceptions=True)

app.title = 'AgriSync Sentiment Insights'

NAVBAR = dbc.Navbar(
    children=[
        html.A(
            # Use row and col to control vertical alignment 
            dbc.Row(
                [
                    dbc.Col(
                        dbc.NavbarBrand("AgriSync Sentiment Insights", className="ml-2",style={'height': '100px'})
                    ),
                ],
                align="center",
                no_gutters=True,
            ),
            href="https://github.com/agrisync/insights-exam-ashish/blob/master/readme.md",
        )
    ],
    color="dark",
    dark=True,
    sticky="top",
)

#Create layout
app.layout = html.Div(children=[NAVBAR,

	#Left column
    html.Div([
		#Scatter Plot
        html.H1(children='Text Sentiment Scatter Plot',style={'backgroundColor':'lightblue'}),
        
        html.Div([
            html.Div([
				#X axis data selection
                dcc.Dropdown(
                    id='xaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[0]
                ),
				#Choice between linear or log axis
                dcc.RadioItems(
                    id='xaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                    value='Linear',
                    labelStyle={'display': 'inline-block'}
                )
            ],
            style={'width': '31%', 'display': 'inline-block'}),

            html.Div([
				#Y axis data selection
                dcc.Dropdown(
                    id='yaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[1]
                ),
				#Choice between linear or log axis
                dcc.RadioItems(
                    id='yaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                    value='Linear',
                    labelStyle={'display': 'inline-block'}
                )
            ],style={'width': '31%', 'float': 'center', 'display': 'inline-block'}),
            
            html.Div([
				#Filter by column
                dcc.Dropdown(
                    id='zaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[1]
                ),
				#Filter choice
                dcc.RadioItems(
                    id='zaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Filter', 'No Filter']],
                    value='No Filter',
                    labelStyle={'display': 'inline-block'}
                )
            ],style={'width': '31%', 'float': 'center', 'display': 'inline-block'})
        ]), 
		#Plot graph
        dcc.Graph(id='graph'),
		
		#Bar chart
        html.H1(children='Sentiment Bar chart',style={'backgroundColor':'lightblue'}),
        
        html.Div([
            html.Div([
				#X axis data selection
                dcc.Dropdown(
                    id='bar_xaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[0]
                ),
				#Choice between linear or log axis
                dcc.RadioItems(
                    id='bar_xaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                    value='Linear',
                    labelStyle={'display': 'inline-block'}
                )
            ],
            style={'width': '31%', 'display': 'inline-block'}),

            
            html.Div([
				#Y axis data selection
                dcc.Dropdown(
                    id='bar_yaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[1]
                ),
				#Choice between linear or log axis
                dcc.RadioItems(
                    id='bar_yaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                    value='Linear',
                    labelStyle={'display': 'inline-block'}
                )
            ],style={'width': '31%', 'float': 'center', 'display': 'inline-block'}),
            
            html.Div([
				#Filter by column
                dcc.Dropdown(
                    id='bar_zaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[1]
                ),
				#Filter choice
                dcc.RadioItems(
                    id='bar_zaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Filter', 'No Filter']],
                    value='No Filter',
                    labelStyle={'display': 'inline-block'}
                )
            ],style={'width': '31%', 'float': 'center', 'display': 'inline-block'})
        ]),
		#Plot graph        
        dcc.Graph(id='bar_chart'),
        
        #Time slider chart
        html.H1(children='Time Slider Chart',style={'backgroundColor':'lightblue'}),
        
        # adding a plot
        dcc.Graph(id='time-slider_plot'),#, figure = fig),
        # dropdown
        html.P([
            html.Label("Choose a feature"),
            dcc.Dropdown(id = 'opt', options=[{'label': i, 'value': i} for i in available_indicators], value=available_indicators[1])
        ], style = {'width': '400px', 'fontSize' : '20px', 'padding-left' : '100px', 'display': 'inline-block'}),
        # range slider
        html.P([
            html.Label("Time Period"),
            dcc.RangeSlider(id = 'slider',
                marks = {i : dates[i] for i in range(0, 9)},
                min = 0,
                max = 8,
                value = [1, 7])
        ],style = {'width' : '80%', 'fontSize' : '20px','padding-left' : '100px','display': 'inline-block'}),
        html.Br(),
        
        html.H1("Text Sentiment Analysis",style={'backgroundColor':'lightblue'}),
        #html.Div([
            html.Br(),
            html.Br(),
            dcc.Input(
                id='input-x',
                placeholder='Enter Text for sentiment analysis',
                type='text',
                value='',
                size='80'
            ),
            
            html.Br(),
            html.Br(),
            html.Br(),
            html.Br(),
            html.Div(id='result'),
            html.Br()
            
            #html.Div([
            #    html.Iframe(id = 'datatable')
            #]),
            #dash_table.DataTable(
            #    id = 'datatable', 
            #    columns =  [{"name": i, "id": i,} for i in vaderList],
            #)   
            
        #],style={'width': '48%', 'display': 'inline-block'})
               
    ], style={'width': '48%', 'display': 'inline-block'}),
 
	#Right column
    html.Div([
		#Box Plot
        html.H1(children='Text Sentiment Box Plot',style={'backgroundColor':'lightblue'}),
        html.Div([
            html.Div([
				#X axis data selection
                dcc.Dropdown(
                    id='box_xaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[0]
                ),
				#Choice between linear or log axis
                dcc.RadioItems(
                    id='box_xaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Filter', 'No Filter']],
                    value='No Filter',
                    labelStyle={'display': 'inline-block'}
                )
            ],
            style={'width': '48%', 'display': 'inline-block'}),

            html.Div([
				#Y axis data selection
                dcc.Dropdown(
                    id='box_yaxis-column',
                    options=[{'label': i, 'value': i} for i in available_indicators],
                    value=available_indicators[1]
                ),
				#Choice between linear or log axis
                dcc.RadioItems(
                    id='box_yaxis-type',
                    options=[{'label': i, 'value': i} for i in ['Linear', 'Log']],
                    value='Linear',
                    labelStyle={'display': 'inline-block'}
                )
            ],style={'width': '48%', 'float': 'center', 'vertical-align': 'top', 'display': 'inline-block'}),
            
        ]),  
		#Plot graph		
        dcc.Graph(id='box_graph'),
        
		#Histogram    
		html.H1(children='Sentiment Histogram',style={'backgroundColor':'lightblue'}),
			html.Div([
				html.Div([
					#Filter by column
					dcc.Dropdown(
						id='histogram_xaxis-column',
						options=[{'label': i, 'value': i} for i in available_indicators],
						value=available_indicators[0]
					),
					#Filter choice
					dcc.RadioItems(
						id='histogram_xaxis-type',
						options=[{'label': i, 'value': i} for i in ['Filter', 'No Filter']],
						value='No Filter',
						labelStyle={'display': 'inline-block'}
					)
				],
				style={'width': '48%', 'display': 'inline-block'}),

				html.Div([
					#Y axis data selection
					dcc.Dropdown(
						id='histogram_yaxis-column',
						options=[{'label': i, 'value': i} for i in available_indicators],
						value=available_indicators[1]
					)
				],style={'width': '48%', 'float': 'center', 'vertical-align': 'top', 'display': 'inline-block'}),
				
			]), 
			#Plot graph
			dcc.Graph(id='histogram_graph'),


            #WordCloud    
            html.H1(children='Text Wordcloud',style={'backgroundColor':'lightblue'}),
            
            html.Div([
                #Filter choice
				dcc.RadioItems(
					id='wordcloud-type',
					options=[{'label': i, 'value': i} for i in ['positive-sentiments-wordcloud']],
					value='No Filter',
					labelStyle={'display': 'inline-block'}
				)
            ],style={'width': '31%', 'display': 'inline-block'}),
                  
			html.Img(id="image_wc"),
            
            html.Br(),
            html.Br(),
            
            html.Div([
                #Filter choice
				dcc.RadioItems(
					id='wordcloud-type1',
					options=[{'label': i, 'value': i} for i in ['negative-sentiments-wordcloud']],
					value='No Filter',
					labelStyle={'display': 'inline-block'}
				)
            ],style={'width': '31%', 'display': 'inline-block'}),
            html.Img(id="image_wc1"),
			#dcc.Graph(id='wordcloud'),
            
            #Top records    
            html.H1(children='Top and Bottom sentiment records',style={'backgroundColor':'lightblue'}),
            
            html.Div([
                dash_table.DataTable(
                    id='typing_formatting_1',
                    data=df_positive_formatting.to_dict('rows'),
                    style_cell={'textAlign': 'left','padding': '8px','overflow': 'hidden','textOverflow': 'ellipsis',},
                    style_data={'whiteSpace': 'normal'},
                    columns=[{
                        'id': 'Id',
                        'name': 'Id',
                        'type': 'numeric'
                    }, {
                        'id': 'CreatedOn',
                        'name': 'Date',
                        'type': 'text'
                    }, {
                        'id': 'Text_sentiment_score',
                        'name': 'score',
                        'type': 'numeric'
                    }, {
                        'id': 'predicted_text_sentiment',
                        'name': 'sentiment',
                        'type': 'text'
                    }],
                    editable=True
                ),
            
                dash_table.DataTable(
                    id='typing_formatting_2',
                    data=df_negative_formatting.to_dict('rows'),
                    style_cell={'textAlign': 'left','padding': '8px','overflow': 'hidden','textOverflow': 'ellipsis',},
                    style_data={'whiteSpace': 'normal'},
                    columns=[{
                        'id': 'Id',
                        'name': 'Id',
                        'type': 'numeric'
                    }, {
                        'id': 'CreatedOn',
                        'name': 'Date',
                        'type': 'text'
                    }, {
                        'id': 'Text_sentiment_score',
                        'name': 'score',
                        'type': 'numeric'
                    }, {
                        'id': 'predicted_text_sentiment',
                        'name': 'sentiment',
                        'type': 'text'
                    }],
                    editable=True
                )
            ],style={'width': '31%', 'display': 'inline-block'})
        
    ], style={'width': '48%', 'display': 'inline-block'}),      
])



    
#Callback for Scatter Plot
@app.callback(
    dash.dependencies.Output('graph', 'figure'),
    [dash.dependencies.Input('xaxis-column', 'value'),
     dash.dependencies.Input('yaxis-column', 'value'),
     dash.dependencies.Input('zaxis-column', 'value'),
     dash.dependencies.Input('xaxis-type', 'value'),
     dash.dependencies.Input('yaxis-type', 'value'),
     dash.dependencies.Input('zaxis-type', 'value')])
def update_graph(xaxis_column_name, yaxis_column_name, zaxis_column_name,
                 xaxis_type, yaxis_type, zaxis_type):

    if zaxis_type == 'Filter':
        data = []
        for value in df[zaxis_column_name].unique():
            data.append(go.Scattergl(
                x=df[df[zaxis_column_name] == value][xaxis_column_name],
                y=df[df[zaxis_column_name] == value][yaxis_column_name],
                name=str(value),
                text=df[df[zaxis_column_name] == value].index.values,
                mode='markers',
                marker={
                    'size': 15,
                    'opacity': 0.5,
                    'line': {'width': 0.5, 'color': 'white'}
                }
            ))
    else:
        data = [go.Scattergl(
            x=df[xaxis_column_name].values,
            y=df[yaxis_column_name].values,
            text=df.index.values,
            mode='markers',
            marker={
                'size': 15,
                'opacity': 0.5,
                'line': {'width': 0.5, 'color': 'white'}
            }
        )]
    return {
        'data': data,
        'layout': go.Layout(
            xaxis={
                'title': xaxis_column_name,
                'type': 'linear' if xaxis_type == 'Linear' else 'log'
            },
            yaxis={
                'title': yaxis_column_name,
                'type': 'linear' if yaxis_type == 'Linear' else 'log'
            },
            hovermode='closest'
        )
    }
	
#Callback for Bar Chart	
@app.callback(
    dash.dependencies.Output('bar_chart', 'figure'),
    [dash.dependencies.Input('bar_xaxis-column', 'value'),
     dash.dependencies.Input('bar_yaxis-column', 'value'),
     dash.dependencies.Input('bar_zaxis-column', 'value'),
     dash.dependencies.Input('bar_xaxis-type', 'value'),
     dash.dependencies.Input('bar_yaxis-type', 'value'),
     dash.dependencies.Input('bar_zaxis-type', 'value')])
def update_graph(xaxis_column_name, yaxis_column_name, zaxis_column_name,
                 xaxis_type, yaxis_type, zaxis_type):

    if zaxis_type == 'Filter':
        data = []
        for value in df[zaxis_column_name].unique():
            data.append(go.Bar(
                x=df[df[zaxis_column_name] == value][xaxis_column_name],
                y=df[df[zaxis_column_name] == value][yaxis_column_name],
                name=str(value),
                text=df[df[zaxis_column_name] == value].index.values
            ))
    else:
	
        data = [go.Bar(
            x=df[xaxis_column_name].values,
            y=df[yaxis_column_name].values,
			text=df.index.values,
        )]
    return {
        'data': data,
        'layout': go.Layout(
            xaxis={
                'title': xaxis_column_name,
                'type': 'linear' if xaxis_type == 'Linear' else 'log'
            },
            yaxis={
                'title': yaxis_column_name,
                'type': 'linear' if yaxis_type == 'Linear' else 'log'
            },
            hovermode='closest'
        )
    }

#Callback for Box Plot
@app.callback(
    dash.dependencies.Output('box_graph', 'figure'),
    [dash.dependencies.Input('box_xaxis-column', 'value'),
     dash.dependencies.Input('box_yaxis-column', 'value'),
     dash.dependencies.Input('box_xaxis-type', 'value'),
     dash.dependencies.Input('box_yaxis-type', 'value'),])
def update_graph(xaxis_column_name, yaxis_column_name, xaxis_type, yaxis_type):
    if xaxis_type == 'Filter':
        data = []
        for value in df[xaxis_column_name].unique():
            trace = {
                    "type": 'box',
                    "x": value,
                    "y": df[df[xaxis_column_name] == value][yaxis_column_name],
                    "name": str(value),
                    "box": {
                        "visible": True
                    },
                    "meanline": {
                        "visible": True
                    }
                }
            data.append(trace)
    else:
        trace = {
                    "type": 'box',
                    "x0": str(yaxis_column_name),
                    "y": df[yaxis_column_name].values,
                    "box": {
                        "visible": True
                    },
                    "meanline": {
                        "visible": True
                    }
                }
        data = [trace]
        
    x_title = xaxis_column_name
    if xaxis_type != 'Filter':
        x_title = ''
    
    return {
            "data": data,
            "layout" : {
                "title": "",
                "xaxis": {
                    'title': x_title,
                },
                "yaxis": {
                    'title': yaxis_column_name,
                    'type': 'linear' if yaxis_type == 'Linear' else 'log',
                }
            }
        }

#Callback for Histogram
@app.callback(
    dash.dependencies.Output('histogram_graph', 'figure'),
    [dash.dependencies.Input('histogram_xaxis-column', 'value'),
     dash.dependencies.Input('histogram_yaxis-column', 'value'),
     dash.dependencies.Input('histogram_xaxis-type', 'value')
    ])
def update_graph(xaxis_column_name, yaxis_column_name, xaxis_type):
    if xaxis_type == 'Filter':
        data = []
        for value in df[xaxis_column_name].unique():
            trace = go.Histogram(
                x=df[df[xaxis_column_name] == value][yaxis_column_name].values,
                name=str(value),
            )
            data.append(trace)
    else:
        trace = go.Histogram(
                x=df[yaxis_column_name].values,
            )
        data = [trace]
    
    return  {
                "data": data,
                "layout" : go.Layout(
                    barmode='stack',
                    xaxis=dict(
                        title=yaxis_column_name
                    ),
                    yaxis=dict(
                        title='count'
                    ),
               )
            }
            
            

#Callback for time-slider_plot
# Step 5. Add callback functions
@app.callback(Output('time-slider_plot', 'figure'),
             [Input('opt', 'value'),
             Input('slider', 'value')])
def update_figure(input1, input2):
    # filtering the data
    #st2 = df[(df.CreatedOn > dates[input2[0]]) & (df.CreatedOn < dates[input2[1]])]
    # updating the plot
    trace_1 = go.Scatter(x = df.CreatedOn, y = df['Text_sentiment_score'],
                        name = 'Text Sentiment score',
                        line = dict(width = 2,
                                    color = 'rgb(229, 151, 50)'))
    trace_2 = go.Scatter(x = df.CreatedOn, y = df[input1],
                        name = input1,
                        line = dict(width = 2,
                                    color = 'rgb(106, 181, 135)'))
    fig = go.Figure(data = [trace_1, trace_2], layout = layut)
    return fig
   

@app.callback(Output('image_wc', 'src'), [Input('wordcloud-type', 'id')])
def make_image(wordcloudtype):
    img = BytesIO()
    data=df
    plot_wordcloud(data,'positive').save(img, format='PNG')
    return 'data:image/png;base64,{}'.format(base64.b64encode(img.getvalue()).decode())
    
    
@app.callback(Output('image_wc1', 'src'), [Input('wordcloud-type1', 'id')])
def make_image1(wordcloudtype):
    img = BytesIO()
    data=df
    plot_wordcloud(data,'negative').save(img, format='PNG')
    return 'data:image/png;base64,{}'.format(base64.b64encode(img.getvalue()).decode())
    

@app.callback(
    Output('result', 'children'),
    #Output('datatable', 'data'),
    [Input('input-x', 'value')]
)
def update_result(x):
    k = analyser.polarity_scores(x)
    #json_object = json.loads(k)
    json_formatted_str = json.dumps(k, indent=2)
    return "Sentiment Analysis result: "+json_formatted_str
    #return k


def plot_wordcloud(data, wordcloudtype):
    if 'negative' in wordcloudtype:
        data = data[data['predicted_text_sentiment']=='negative']
    else:
        data = data[data['predicted_text_sentiment']=='positive']
    words = ' '.join(data['Text'])
    cleaned_word = " ".join([word for word in words.split()])
    fig = wc.generate(cleaned_word)
    return fig.to_image()   


if __name__ == '__main__':
    app.run_server(debug=True)  