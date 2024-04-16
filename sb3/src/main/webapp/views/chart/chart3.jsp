<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .chart_layout{
        width:300px;
        height:400px;
        border:2px solid darkslategray;
    }
</style>
<script>
    let chart3 = {
        init: function () {
            this.get1();
            this.get3();
            this.get2();
        },
        get1(){
            // Generate test data with discrete X values and continuous Y values.
            const getTestData = x => {
                const off = 0.2 + 0.2 * Math.random();
                return new Array(200).fill(1).map(() => [
                    x,
                    off + (Math.random() - 0.5) * (Math.random() - 0.5)
                ]);
            };

// Make all the colors semi-transparent so we can see overlapping dots
            const colors = Highcharts.getOptions().colors.map(color =>
                Highcharts.color(color).setOpacity(0.5).get()
            );

            Highcharts.chart('c1', {
                chart: {
                    type: 'scatter'
                },

                colors,

                title: {
                    text: 'Scatter chart with jitter'
                },

                xAxis: {
                    categories: ['Run 1', 'Run 2', 'Run 3', 'Run 4', 'Run 5']
                },

                yAxis: {
                    title: {
                        text: 'Measurements'
                    }
                },

                plotOptions: {
                    scatter: {
                        showInLegend: false,
                        jitter: {
                            x: 0.24,
                            y: 0
                        },
                        marker: {
                            radius: 2,
                            symbol: 'circle'
                        },
                        tooltip: {
                            pointFormat: 'Measurement: {point.y:.3f}'
                        }
                    }
                },

                series: [{
                    name: 'Run 1',
                    data: getTestData(0)
                }, {
                    name: 'Run 2',
                    data: getTestData(1)
                }, {
                    name: 'Run 3',
                    data: getTestData(2)
                }, {
                    name: 'Run 4',
                    data: getTestData(3)
                }, {
                    name: 'Run 5',
                    data: getTestData(4)
                }]
            });

        },
        get2(){
            const dataPrev = {
                2020: [
                    ['kr', 9],
                    ['jp', 12],
                    ['au', 8],
                    ['de', 17],
                    ['ru', 19],
                    ['cn', 26],
                    ['gb', 27],
                    ['us', 46]
                ],
                2016: [
                    ['kr', 13],
                    ['jp', 7],
                    ['au', 8],
                    ['de', 11],
                    ['ru', 20],
                    ['cn', 38],
                    ['gb', 29],
                    ['us', 47]
                ],
                2012: [
                    ['kr', 13],
                    ['jp', 9],
                    ['au', 14],
                    ['de', 16],
                    ['ru', 24],
                    ['cn', 48],
                    ['gb', 19],
                    ['us', 36]
                ],
                2008: [
                    ['kr', 9],
                    ['jp', 17],
                    ['au', 18],
                    ['de', 13],
                    ['ru', 29],
                    ['cn', 33],
                    ['gb', 9],
                    ['us', 37]
                ],
                2004: [
                    ['kr', 8],
                    ['jp', 5],
                    ['au', 16],
                    ['de', 13],
                    ['ru', 32],
                    ['cn', 28],
                    ['gb', 11],
                    ['us', 37]
                ],
                2000: [
                    ['kr', 7],
                    ['jp', 3],
                    ['au', 9],
                    ['de', 20],
                    ['ru', 26],
                    ['cn', 16],
                    ['gb', 1],
                    ['us', 44]
                ]
            };

            const data = {
                2020: [
                    ['kr', 6],
                    ['jp', 27],
                    ['au', 17],
                    ['de', 10],
                    ['ru', 20],
                    ['cn', 38],
                    ['gb', 22],
                    ['us', 39]
                ],
                2016: [
                    ['kr', 9],
                    ['jp', 12],
                    ['au', 8],
                    ['de', 17],
                    ['ru', 19],
                    ['cn', 26],
                    ['gb', 27],
                    ['us', 46]
                ],
                2012: [
                    ['kr', 13],
                    ['jp', 7],
                    ['au', 8],
                    ['de', 11],
                    ['ru', 20],
                    ['cn', 38],
                    ['gb', 29],
                    ['us', 47]
                ],
                2008: [
                    ['kr', 13],
                    ['jp', 9],
                    ['au', 14],
                    ['de', 16],
                    ['ru', 24],
                    ['cn', 48],
                    ['gb', 19],
                    ['us', 36]
                ],
                2004: [
                    ['kr', 9],
                    ['jp', 17],
                    ['au', 18],
                    ['de', 13],
                    ['ru', 29],
                    ['cn', 33],
                    ['gb', 9],
                    ['us', 37]
                ],
                2000: [
                    ['kr', 8],
                    ['jp', 5],
                    ['au', 16],
                    ['de', 13],
                    ['ru', 32],
                    ['cn', 28],
                    ['gb', 11],
                    ['us', 37]
                ]
            };

            const countries = {
                kr: {
                    name: 'South Korea',
                    color: '#FE2371'
                },
                jp: {
                    name: 'Japan',
                    color: '#544FC5'
                },
                au: {
                    name: 'Australia',
                    color: '#2CAFFE'
                },
                de: {
                    name: 'Germany',
                    color: '#FE6A35'
                },
                ru: {
                    name: 'Russia',
                    color: '#6B8ABC'
                },
                cn: {
                    name: 'China',
                    color: '#1C74BD'
                },
                gb: {
                    name: 'Great Britain',
                    color: '#00A6A6'
                },
                us: {
                    name: 'United States',
                    color: '#D568FB'
                }
            };

// Add upper case country code
            for (const [key, value] of Object.entries(countries)) {
                value.ucCode = key.toUpperCase();
            }


            const getData = data => data.map(point => ({
                name: point[0],
                y: point[1],
                color: countries[point[0]].color
            }));

            const chart = Highcharts.chart('c2', {
                chart: {
                    type: 'column'
                },
                // Custom option for templates
                countries,
                title: {
                    text: 'Summer Olympics 2020 - Top 5 countries by Gold medals',
                    align: 'left'
                },
                subtitle: {
                    text: 'Comparing to results from Summer Olympics 2016 - Source: <a ' +
                        'href="https://olympics.com/en/olympic-games/tokyo-2020/medals"' +
                        'target="_blank">Olympics</a>',
                    align: 'left'
                },
                plotOptions: {
                    series: {
                        grouping: false,
                        borderWidth: 0
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    shared: true,
                    headerFormat: '<span style="font-size: 15px">' +
                        '{series.chart.options.countries.(point.key).name}' +
                        '</span><br/>',
                    pointFormat: '<span style="color:{point.color}">\u25CF</span> ' +
                        '{series.name}: <b>{point.y} medals</b><br/>'
                },
                xAxis: {
                    type: 'category',
                    accessibility: {
                        description: 'Countries'
                    },
                    max: 4,
                    labels: {
                        useHTML: true,
                        animate: true,
                        format: '{chart.options.countries.(value).ucCode}<br>' +
                            '<span class="f32">' +
                            '<span style="display:inline-block;height:32px;vertical-align:text-top;" ' +
                            'class="flag {value}"></span></span>',
                        style: {
                            textAlign: 'center'
                        }
                    }
                },
                yAxis: [{
                    title: {
                        text: 'Gold medals'
                    },
                    showFirstLabel: false
                }],
                series: [{
                    color: 'rgba(158, 159, 163, 0.5)',
                    pointPlacement: -0.2,
                    linkedTo: 'main',
                    data: dataPrev[2020].slice(),
                    name: '2016'
                }, {
                    name: '2020',
                    id: 'main',
                    dataSorting: {
                        enabled: true,
                        matchByName: true
                    },
                    dataLabels: [{
                        enabled: true,
                        inside: true,
                        style: {
                            fontSize: '16px'
                        }
                    }],
                    data: getData(data[2020]).slice()
                }],
                exporting: {
                    allowHTML: true
                }
            });

            const locations = [
                {
                    city: 'Tokyo',
                    year: 2020
                }, {
                    city: 'Rio',
                    year: 2016
                }, {
                    city: 'London',
                    year: 2012
                }, {
                    city: 'Beijing',
                    year: 2008
                }, {
                    city: 'Athens',
                    year: 2004
                }, {
                    city: 'Sydney',
                    year: 2000
                }
            ];

            locations.forEach(location => {
                const btn = document.getElementById(location.year);

                btn.addEventListener('click', () => {

                    document.querySelectorAll('.buttons button.active')
                        .forEach(active => {
                            active.className = '';
                        });
                    btn.className = 'active';

                    chart.update({
                        title: {
                            text: 'Summer Olympics ' + location.year +
                                ' - Top 5 countries by Gold medals'
                        },
                        subtitle: {
                            text: 'Comparing to results from Summer Olympics ' +
                                (location.year - 4) + ' - Source: <a href="https://olympics.com/en/olympic-games/' +
                                (location.city.toLowerCase()) + '-' + (location.year) + '/medals" target="_blank">Olympics</a>'
                        },
                        series: [{
                            name: location.year - 4,
                            data: dataPrev[location.year].slice()
                        }, {
                            name: location.year,
                            data: getData(data[location.year]).slice()
                        }]
                    }, true, false, {
                        duration: 800
                    });
                });
            });




        },
        get3(){
            // Set up the chart
            Highcharts.chart('c3', {
                chart: {
                    type: 'funnel3d',
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        depth: 50,
                        viewDistance: 50
                    }
                },
                title: {
                    text: 'Highcharts Funnel3D Chart'
                },
                accessibility: {
                    screenReaderSection: {
                        beforeChartFormat: '<{headingTagName}>{chartTitle}</{headingTagName}><div>{typeDescription}</div><div>{chartSubtitle}</div><div>{chartLongdesc}</div>'
                    }
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b> ({point.y:,.0f})',
                            allowOverlap: true,
                            y: 10
                        },
                        neckWidth: '30%',
                        neckHeight: '25%',
                        width: '80%',
                        height: '80%'
                    }
                },
                series: [{
                    name: 'Unique users',
                    data: [
                        ['Website visits', 15654],
                        ['Downloads', 4064],
                        ['Requested price list', 1987],
                        ['Invoice sent', 976],
                        ['Finalized', 846]
                    ]
                }]
            });
        }
    };
    $(function () {
        chart3.init();
    });
</script>
<div class="container">
    <h2>Chart3 page</h2>
    <div class="row well">
        <div id="c1" class="col-sm4 well chart_layout"></div>
        <div id="c2" class="col-sm4 well chart_layout"></div>
        <div id="c3" class="col-sm4 well chart_layout"></div>
    </div>
</div>
